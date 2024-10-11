import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/dialogHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/StoreSelectionModels/storeFronts.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/StoreSelectionModels/storeSelectionResponse.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/StoreSelection/bloc/storeSelectionScreenStates.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/imagesConstant.dart';
import '../../Constants/routeConstant.dart';
import '../../CustomWidgets/CommonButton.dart';
import '../../Helper/globalData.dart';
import 'Widgets/storeSelectionGridView.dart';

class StoreSelectionScreen extends StatefulWidget {
  bool isFromLogin;

  StoreSelectionScreen(this.isFromLogin, {Key? key}) : super(key: key);

  @override
  State<StoreSelectionScreen> createState() => _StoreSelectionScreenState();
}

class _StoreSelectionScreenState extends State<StoreSelectionScreen> {
  StoreSelectionScreenBloc? _storeSelectionScreenBloc;
  bool isLoading = true;
  StoreSelectionResponse? storeSelectionResponse;
  StoreFront? selectedStoreFront;

  @override
  void initState() {
    _storeSelectionScreenBloc = context.read<StoreSelectionScreenBloc>();
    _storeSelectionScreenBloc?.add(StoreSelectionScreenFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    _storeSelectionScreenBloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!widget.isFromLogin) {
          Navigator.pushNamedAndRemoveUntil(
              context, bottomNavigation, (route) => false);
          GlobalData.selectedIndex = 0;
        }

        return true;
      },
      child: Scaffold(
          backgroundColor: MobikulTheme.lightGreyTest,
          // appBar: (widget.isFromLogin)
          //     ? null
          //     : PreferredSize(
          //         preferredSize: const Size.fromHeight(AppSizes.appBarSize),
          //         child: commonAppBar(context, false, "", false),
          //       ),
          body: SafeArea(
            child: BlocBuilder<StoreSelectionScreenBloc,
                StoreSelectionScreenStates>(
              builder: (context, currentState) {
                if (currentState is StoreSelectionScreenInitialState) {
                  isLoading = true;
                } else if (currentState is StoreSelectionScreenSuccessState) {
                  isLoading = false;
                  storeSelectionResponse = currentState.selectionResponse;
                  StoreFront storeData = StorageController().getStoreData() ??
                      StoreFront('', '', '', '');

                  if (storeData.url != '') {
                    selectedStoreFront = storeData;
                  } else {
                    storeSelectionResponse?.storeFrontList?.forEach((element) {
                      if (element.isDefault == "Y") {
                        selectedStoreFront = element;
                      }
                    });
                  }
                } else if (currentState is StoreSelectionCompleteState) {
                  isLoading = false;
                  selectedStoreFront = currentState.selectedStoreFront;

                  for (int i = 0;
                      i < storeSelectionResponse!.storeFrontList!.length;
                      i++) {
                    if (selectedStoreFront!.storefrontId ==
                        storeSelectionResponse!
                            .storeFrontList![i].storefrontId) {
                      storeSelectionResponse!.storeFrontList![i].isDefault =
                          "Y";
                    } else {
                      storeSelectionResponse!.storeFrontList![i].isDefault =
                          "N";
                    }
                  }
                  print("DATA----->${storeSelectionResponse!.storeFrontList}");
                } else if (currentState is StoreSelectionScreenErrorState) {
                  isLoading = false;
                }
                return buildMainUI();
              },
            ),
          )),
    );
  }

  Widget buildMainUI() {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(AppSizes.extraPadding),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Visibility(
                  //   visible: widget.isFromLogin,
                  //   child: SizedBox(
                  //     height: AppSizes.width / 5,
                  //   ),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Container(
                  //         height: 42,
                  //         width: 42,
                  //         decoration: BoxDecoration(
                  //           color: AppColors.white,
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //         padding: const EdgeInsets.all(11),
                  //         child: Image.asset(
                  //           'assets/Images/arrow-left.png',
                  //           color: AppColors.black,
                  //         ),
                  //       ),
                  //     ),
                  //     Align(
                  //       alignment: Alignment.center,
                  //       child: Image.asset(
                  //         AppImages.appLogo,
                  //         height: 30,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 42,
                  //     )
                  //   ],
                  // ),
                  const SizedBox(
                    height: AppSizes.size50,
                  ),
                  Text(
                    '${GenericMethods.getStringValue(context, AppStringConstant.selectStore)}.\n${GenericMethods.getStringValue(context, AppStringConstant.storeSelectionHeading)}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontFamily: 'SF-Pro-Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // const SizedBox(
                  //   height: AppSizes.extraPadding * 2,
                  // ),
                  // Text(
                  //   GenericMethods.getStringValue(
                  //       context, AppStringConstant.storeSelectionHeading),
                  //   style: Theme.of(context).textTheme.bodyLarge,
                  // ),
                  const SizedBox(
                    height: AppSizes.extraPadding,
                  ),
                  Text(
                    GenericMethods.getStringValue(
                        context, AppStringConstant.storeSelectionSubheading),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SF-Pro-Display',
                      color: AppColors.black.withOpacity(0.35),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.size35,
                  ),
                  isLoading
                      ? Container()
                      : storeSelectionGridView(
                          context,
                          storeSelectionResponse!,
                          _storeSelectionScreenBloc!,
                          selectedStoreFront,
                        ),
                ],
              ),
            ),
            const Spacer(),
            commonButton(context, () {
              // if(!widget.isFromLogin){
              //   DialogHelper.confirmationDialog(
              //       GenericMethods.getStringValue(
              //           context, AppStringConstant.storeChangeWarning),
              //       context, onConfirm: () {
              //     storageController.setStoreDetails(selectedStoreFront!);
              //     Future.delayed(const Duration(milliseconds: 500 ), (){
              //       GlobalData.selectedIndex = 0;
              //       Navigator.pushNamedAndRemoveUntil(
              //           context, bottomNavigation, (route) => false);
              //     });
              //   });
              // }
              // else{
              storageController.setStoreDetails(selectedStoreFront!);
              Future.delayed(const Duration(milliseconds: 500), () {
                GlobalData.selectedIndex = 0;
                Navigator.pushNamedAndRemoveUntil(
                    context, bottomNavigation, (route) => false);
              });
              // }
            },
                GenericMethods.getStringValue(
                    context, AppStringConstant.proceed),
                textColor: AppColors.white,
                height: 50,
                borderRadius: 12)
          ],
        ),
      ),
      Visibility(visible: isLoading, child: const Loader())
    ]);
  }
}
