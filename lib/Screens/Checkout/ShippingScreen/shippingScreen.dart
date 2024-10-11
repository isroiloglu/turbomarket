import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/arguments_map.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/commonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Request/shipping_method_request.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/Widgets/shippingMethodDisplayWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/bloc/shippingBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/bloc/shippingStates.dart';

import '../../../CommonWidgets/AppBar/checkoutAppBar.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/loader.dart';
import '../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method.dart';
import '../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method.dart';
import '../Widgets/horizontalCustomStepper.dart';

class ShippingScreen extends StatefulWidget {


  Map<String, dynamic>? mapData;

  ShippingScreen(
      {Key? key,  this.mapData})
      : super(key: key);

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  ShippingScreenBloc? shippingScreenBloc;
  ShippingMethodRequest? shippingMethodRequest;
  bool isLoading = false;
  ShippingMethodModel? shippingModels;
  List<String>? shippingId=[];
  shippingMethods? selectedShippingMethod;


  final List<String> titles = [
    AppStringConstant.customer,
    AppStringConstant.delivery,
    AppStringConstant.payment
  ];
  final List<String> activeIcons = [
    'assets/Images/profile.png',
    'assets/Images/truck-fast.png',
    'assets/Images/empty-wallet.png'
  ];
  final List<String> inactiveIcons = [
    'assets/Images/customer-inactive.png',
    'assets/Images/delivery-inactive.png',
    'assets/Images/payment-inactive.png'
  ];

  final int _curStep = 1;

  @override
  void initState() {
    GlobalData.selectedStore="";
    shippingScreenBloc = context.read<ShippingScreenBloc>();
    shippingModels=widget?.mapData?["shippingModel"];
    if((shippingModels?.shipping?.shippingMethodList??[]).isNotEmpty){
      selectedShippingMethod=shippingModels?.shipping?.shippingMethodList?[0];
      shippingId?.add(shippingModels?.shipping?.shippingMethodList?[0]?.shippingId??"");
    }
    super.initState();
  }

  void onChanged(shippingMethods value) {
    selectedShippingMethod = value;
    setState(() {
      shippingId?.clear();
      shippingId?.add(selectedShippingMethod?.shippingId??"");
    });

    print("Shipping Method -------> $shippingId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobikulTheme.lightGreyTest,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarSize+20),
        child: checkoutAppbar(
          context,
          GenericMethods.getStringValue(context, AppStringConstant.ordering),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ShippingScreenBloc, ShippingScreenState>(
            builder: (context, currentState) {
          if (currentState is ShippingScreenInitialState) {
          } else if (currentState is ShippingScreenFetchShippingMethodState) {
            isLoading = false;
          }
          return listOfShippingMethods();
        }),
      ),
    );
  }

  Widget listOfShippingMethods() {
    return Stack(
      children: [
        Column(
          children: [
            HorizontalCustomStepper(
              curStep: _curStep,
              titles: titles,
              color: Colors.black,
              activeImages: activeIcons,
              inactiveImages: inactiveIcons,
            ),
            (shippingModels?.shipping?.shippingMethodList??[]).isEmpty?Expanded(
              child: Center(
                child: Text(
                    (shippingModels?.shipping?.isShippingRequired??false)?GenericMethods.getStringValue(context, AppStringConstant.noShippingMethod):GenericMethods.getStringValue(context, AppStringConstant.noShippingMethodRequired)
                ),
              ),
            ): Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: (AppSizes.width / 7 + AppSizes.sidePadding*2)),
                child: ShippingMethodDisplayWidget(allShippingMethods: shippingModels?.shipping?.shippingMethodList,onChanged:onChanged),
              )
            ),

          ],
        ),
        Visibility(
          child: Positioned(
            bottom: AppSizes.sidePadding,
            right: AppSizes.sidePadding,
            left: AppSizes.sidePadding,
            child: commonButton(context, () {

              if((shippingModels?.shipping?.shippingMethodList??[]).isEmpty){
                if(((shippingModels?.shipping?.isShippingRequired??false))==true){
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AlertMessage.showError(GenericMethods.getStringValue(context, AppStringConstant.pleaseSelectShippingMethod) ?? '', context);
                  });
                }else{
                  // not required
                  shippingId?.add("");
                  Navigator.pushNamed(context, paymentScreen,arguments: getPaymentPageMap(shippingId??[]));
                }
              }else{
                if((shippingId??[]).isNotEmpty){
                  if((selectedShippingMethod?.stores??[]).isNotEmpty){
                    if(GlobalData.selectedStore.isNotEmpty){
                      Navigator.pushNamed(context, paymentScreen,arguments: getPaymentPageMap(shippingId??[]));
                    }else{
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        AlertMessage.showError(GenericMethods.getStringValue(context, AppStringConstant.pleaseSelectStore) ?? '', context);
                      });

                    }
                  }else{
                    Navigator.pushNamed(context, paymentScreen,arguments: getPaymentPageMap(shippingId??[]));
                  }
                }else{
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AlertMessage.showError(GenericMethods.getStringValue(context, AppStringConstant.pleaseSelectShippingMethod) ?? '', context);
                  });
                }

              }

            }, GenericMethods.getStringValue(context, AppStringConstant.save),
                textColor: AppColors.white,
                textStyle: TextStyle(fontFamily: 'SF-Pro-Display',fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.white),
borderRadius: 12,
                fontWeight: FontWeight.w600,
                height: AppSizes.width / 7),
          ),
        ),
        Visibility(visible: isLoading , child: const Loader())
      ],
    );
  }
}
