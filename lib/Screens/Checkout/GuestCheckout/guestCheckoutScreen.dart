import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CheckoutModels/GuestCheckout/Request/guestUserData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/GuestCheckout/bloc/guestCheckoutBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/GuestCheckout/bloc/guestCheckoutStates.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/GuestCheckout/widgets/guestBillingAddress.dart';

import '../../../CommonWidgets/AppBar/checkoutAppBar.dart';
import '../../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Constants/arguments_map.dart';
import '../../../Constants/routeConstant.dart';
import '../../../CustomWidgets/CommonButton.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/loader.dart';
import '../../../Models/AccountModels/Request/updateProfileRequest.dart';
import '../../../Models/CheckoutModels/GuestCheckout/Request/submitDataRequest.dart';
import '../../../Models/CheckoutModels/GuestCheckout/Response/guestProfileData.dart';
import '../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import '../Widgets/horizontalCustomStepper.dart';
import 'bloc/guestCheckoutEvents.dart';

class GuestCheckoutScreen extends StatefulWidget {
  const GuestCheckoutScreen({Key? key}) : super(key: key);

  @override
  State<GuestCheckoutScreen> createState() => _GuestCheckoutScreenState();
}

class _GuestCheckoutScreenState extends State<GuestCheckoutScreen> {
  final List<String> titles = [
    AppStringConstant.customer,
    AppStringConstant.delivery,
    AppStringConstant.payment
  ];
  final List<String> activeIcons = [
    'assets/Images/customer-active.png',
    'assets/Images/delivery-active.png',
    'assets/Images/payment-active.png'
  ];
  final List<String> inactiveIcons = [
    'assets/Images/customer-inactive.png',
    'assets/Images/delivery-inactive.png',
    'assets/Images/payment-inactive.png'
  ];
  bool isLoading = true;
  final int _curStep = 0;

  ShippingMethodModel? shippingMethodModel;



  GuestProfileData? guestProfileData;
  GuestCheckoutBloc? bloc;
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isProfileAdding=false;


  @override
  void initState() {
    GlobalData.guestUserData=GuestUserData.empty();
    bloc = context.read<GuestCheckoutBloc>();
    bloc?.add(GuestCheckoutFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarSize),
        child: checkoutAppbar(
            context,
            GenericMethods.getStringValue(
                context, AppStringConstant.ordering),
            ),
      ),

      body: SafeArea(child:
      BlocBuilder<GuestCheckoutBloc, GuestCheckoutStates>(
          builder: (context, currentState) {
            if (currentState is GuestCheckoutInitialState) {
              if (guestProfileData != null) {
                isLoading = false;
              }else{
                isLoading=true;
              }
            }

            else if (currentState is GuestCheckoutDataFetchState) {
              guestProfileData = currentState.guestProfileData;
              isLoading = false;
              isProfileAdding = false;
            }
            else if (currentState is GuestCheckoutSubmitState) {
              isLoading = false;
              isProfileAdding=false;

              if((currentState.baseResponse?.error??false)==true){
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AlertMessage.showError(currentState.baseResponse?.message ?? '', context);
                });
              }else{
                if(currentState.baseResponse!=null && currentState.baseResponse?.allShipping!=null){
                  shippingMethodModel=currentState.baseResponse;
                  Timer(const Duration(milliseconds: 500), () async {
                    Navigator.pushNamed(context, shippingScreen,arguments: getShippingMap(shippingMethodModel));
                  });
                }
              }


            }
            else if (currentState is GuestCheckoutErrorState) {
              isLoading = false;
              isProfileAdding=false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showError(currentState.message ?? '', context);
              });
            }
            bloc?.emit(GuestCheckoutEmptyState());
            return guestProfileData == null
                ? const Loader()
                : buildMainUI();
          })));

  }

  void validateForm() {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() == true) {
      GenericMethods.hideSoftKeyBoard();
      SubmitUserDataRequest submitUserDataRequest=SubmitUserDataRequest.empty();
      GlobalData.guestUserData.userId = (storageController.getUserData()?.userId ?? "") ?? "";
      submitUserDataRequest.userData=GlobalData.guestUserData;
      submitUserDataRequest.companyId=storageController.getCompanyId();
      submitUserDataRequest.walletSystem=0;
      submitUserDataRequest.displaySubtotal=0.0;
      submitUserDataRequest.userType="C";
      submitUserDataRequest.view="checkout";
      submitUserDataRequest.shipToAnother=GlobalData.guestUserData.shipToAnother;
      submitUserDataRequest.selectGdprAgreement="Y";
      submitUserDataRequest.langCode=storageController.getCurrentLanguage();
      submitUserDataRequest.currencyCode=storageController.getCurrentCurrency();
      submitUserDataRequest.guestCheckout="Y";
      submitUserDataRequest.gc="${storageController.getGiftCode().toList().reversed.toList()}".replaceAll(" ", "");
      bloc?.add(GuestCheckoutSubmitEvent(submitUserDataRequest));
      isProfileAdding=true;
      print("GUEST CHECKOUT DATA ------->${GlobalData.guestUserData?.toJson()}");
    } else {

    }
  }

  Widget buildMainUI(){
    return Stack(
      children: [
        Form( key: _formKey,child:isLoading? Container():Column(
          children: [
            HorizontalCustomStepper(
              curStep: _curStep,
              titles: titles,
              color: Colors.black,
              activeImages: activeIcons,
              inactiveImages: inactiveIcons,
            ),

            Expanded(child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSizes.extraPadding),
                    child: GuestBillingAddress(guestProfileData!),
                  ),

                ],
              ),
            ))
          ],
        ) ),
        Visibility(
          visible: !isLoading,
          child: Positioned(  bottom: AppSizes.sidePadding,
            right: AppSizes.sidePadding,
            left: AppSizes.sidePadding,child: commonButton(context, () {
              validateForm();
            },
                GenericMethods.getStringValue(context, AppStringConstant.save),
                textColor: AppColors.white,
                fontWeight: FontWeight.w600,

                height: AppSizes.width / 7),),
        ),
        Visibility(visible:isLoading|| isProfileAdding,child: const Loader())
      ],

    );
  }
}
