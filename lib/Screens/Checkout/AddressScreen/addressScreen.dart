import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/AppBar/commonAppBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/arguments_map.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/Widgets/profileCard.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/bloc/profilesBloc/multipleProfilesBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/bloc/profilesBloc/multipleProfilesEvent.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/bloc/profilesBloc/multipleProfilesState.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/widgets/billingAddressWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/ShippingScreen/shippingScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/Widgets/horizontalCustomStepper.dart';
import '../../../CommonWidgets/AppBar/checkoutAppBar.dart';
import '../../../Config/theme.dart';
import '../../../Constants/appConstants.dart';
import '../../../CustomWidgets/CommonButton.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/globalData.dart';
import '../../../Helper/loader.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/AccountModels/Request/createProfileRequest.dart';
import '../../../Models/AccountModels/Request/profileData.dart';
import '../../../Models/AccountModels/Request/updateProfileRequest.dart';
import '../../../Models/CheckoutModels/LoginUser/Request/updateProfileCheckoutRequest.dart';
import '../../../Models/MultipleProfilesModel/profileUserModel.dart';
import '../../../Models/MultipleProfilesModel/response/multipleProfileResponse.dart';
import '../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
  bool isLoading = true;
  final int _curStep = 0;
  MultipleProfilesResponse? multipleProfilesResponse;
  MultipleProfilesBloc? multipleProfilesBloc;
  ProfileUserModel? selectedProfile;
  ShippingMethodModel? shippingMethodModel;

  bool isNewCreated = false;
  int selectedIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isProfileAdding = false;
  bool dataUpdate = false;

  @override
  void initState() {
    multipleProfilesBloc = context.read<MultipleProfilesBloc>();
    multipleProfilesBloc?.add(MultipleProfileFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MobikulTheme.lightGreyTest,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.appBarSize + 20),
          child: checkoutAppbar(
            context,
            GenericMethods.getStringValue(context, AppStringConstant.ordering),
          ),
        ),
        body: SafeArea(child:
            BlocBuilder<MultipleProfilesBloc, MultipleProfileState>(
                builder: (context, currentState) {
          if (currentState is MultipleProfileInitialState) {
            if (multipleProfilesResponse != null) {
              isLoading = false;
            } else {
              isLoading = true;
            }
          } else if (currentState is MultipleProfileSuccessState) {
            multipleProfilesResponse = currentState.data;
            isLoading = false;
            isProfileAdding = false;
            selectedProfile = multipleProfilesResponse?.users?[0];
          } else if (currentState is MultipleProfileReloadState) {
            multipleProfilesResponse = currentState.accountDetailResponse;
            isLoading = false;
            isProfileAdding = false;
            if (multipleProfilesResponse?.users != null &&
                (multipleProfilesResponse?.users?.length ?? 0) > 0) {
              if (isNewCreated) {
                selectedProfile = multipleProfilesResponse?.users?[
                    (multipleProfilesResponse?.users?.length ?? 0) - 1];
                //
              } else {
                selectedProfile = selectedProfile;
              }
            }

            GlobalData.selectedProfileForCheckout = selectedProfile;
            if (shippingMethodModel != null) {
              Future.delayed(Duration.zero, () {
                Navigator.pushNamed(context, shippingScreen,
                    arguments: getShippingMap(shippingMethodModel));
              });
            }
          } else if (currentState is MultipleProfileSaveSuccessState) {
            isProfileAdding = false;
            if (currentState.shippingMethods.shipping != null) {
              multipleProfilesBloc?.add(MultipleProfileReload());
              shippingMethodModel = currentState.shippingMethods;
              isProfileAdding = true;
            } else {
              multipleProfilesBloc?.add(MultipleProfileReload());
              isProfileAdding = true;
              // WidgetsBinding.instance?.addPostFrameCallback((_) {
              //   AlertMessage.showError("", context);
              // });
            }
          } else if (currentState is MultipleProfileErrorState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(currentState.message ?? '', context);
            });
          }
          multipleProfilesBloc?.emit(EmptyState());
          return multipleProfilesResponse == null
              ? const Loader()
              : buildMainUI();
        })));
  }

  void validateAddressForm() {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
      GenericMethods.hideSoftKeyBoard();
      if (!isNewCreated) {
        UpdateProfileCheckoutRequest updateProfileCheckoutRequest =
            UpdateProfileCheckoutRequest.empty();
        ProfileData profileData = ProfileData.empty();
        profileData.userId = selectedProfile?.userId ?? "";
        profileData.profileName =
            GlobalData.updateProfileRequest.profileName ?? '';
        profileData.bAddress = GlobalData.updateProfileRequest.bAddress;
        profileData.sState = GlobalData.updateProfileRequest.sState ?? "";
        profileData.sPhone = GlobalData.updateProfileRequest.sPhone ?? "";
        profileData.sZipcode = GlobalData.updateProfileRequest.sZipcode ?? "";
        profileData.sLastname = GlobalData.updateProfileRequest.sLastName ?? "";
        profileData.sFirstname =
            GlobalData.updateProfileRequest.sFirstName ?? "";
        profileData.sCountry = GlobalData.updateProfileRequest.sCountry ?? "";
        profileData.sCity = GlobalData.updateProfileRequest.sCity ?? "";
        profileData.sAddress = GlobalData.updateProfileRequest.sAddress ?? "";
        profileData.profileMailingLis1 = true;
        profileData.bZipcode = GlobalData.updateProfileRequest.bZipcode ?? '';
        profileData.bState = GlobalData.updateProfileRequest.bState ?? '';
        profileData.bPhone = GlobalData.updateProfileRequest.bPhone ?? '';
        profileData.bLastname = GlobalData.updateProfileRequest.bLastname ?? '';
        profileData.bFirstname =
            GlobalData.updateProfileRequest.bFirstname ?? '';
        profileData.bCity = GlobalData.updateProfileRequest.bCity ?? '';
        profileData.bCountry = GlobalData.updateProfileRequest.bCountry ?? '';
        profileData.bZipcode = GlobalData.updateProfileRequest.bZipcode ?? '';
        profileData.shipToAnother =
            GlobalData.updateProfileRequest.shipToAnother ?? 0;
        updateProfileCheckoutRequest.userData = profileData;

        print("PROFILE DATA -------->${profileData.toJson().toString()}");

        updateProfileCheckoutRequest.companyId = selectedProfile?.companyId;
        updateProfileCheckoutRequest.currencyCode =
            storageController.getCurrentCurrency();
        updateProfileCheckoutRequest.gc =
            "${storageController.getGiftCode().toList().reversed.toList()}"
                .replaceAll(" ", "");
        updateProfileCheckoutRequest.langCode =
            storageController.getCurrentLanguage();
        updateProfileCheckoutRequest.profileId = selectedProfile?.profileId;
        updateProfileCheckoutRequest.selectGdprAgreement = "y";
        updateProfileCheckoutRequest.shipToAnother =
            GlobalData.updateProfileRequest.shipToAnother;
        updateProfileCheckoutRequest.updateUserData = "Y";
        updateProfileCheckoutRequest.userType = "C";
        updateProfileCheckoutRequest.view = "checkout";
        updateProfileCheckoutRequest.walletSystem = 0;
        updateProfileCheckoutRequest.displaySubtotal = 0.0;
        multipleProfilesBloc?.add(
            MultipleProfileUpdateProfileEvent(updateProfileCheckoutRequest));
        isProfileAdding = true;
        dataUpdate = true;
      } else {
        CreateProfileRequest createProfileRequest =
            CreateProfileRequest.empty();
        createProfileRequest.langCode = storageController.getCurrentLanguage();
        ProfileData profileData = ProfileData.empty();
        profileData.userId =
            (storageController.getUserData()?.userId ?? "").toString();
        profileData.profileName =
            GlobalData.updateProfileRequest.profileName ?? '';
        profileData.bAddress = GlobalData.updateProfileRequest.bAddress;
        profileData.sState = GlobalData.updateProfileRequest.sState ?? "";
        profileData.sPhone = GlobalData.updateProfileRequest.sPhone ?? "";
        profileData.sZipcode = GlobalData.updateProfileRequest.sZipcode ?? "";
        profileData.sLastname = GlobalData.updateProfileRequest.sLastName ?? "";
        profileData.sFirstname =
            GlobalData.updateProfileRequest.sFirstName ?? "";
        profileData.sCountry = GlobalData.updateProfileRequest.sCountry ?? "";
        profileData.sCity = GlobalData.updateProfileRequest.sCity ?? "";
        profileData.sAddress = GlobalData.updateProfileRequest.sAddress ?? "";
        profileData.profileMailingLis1 = true;
        profileData.bZipcode = GlobalData.updateProfileRequest.bZipcode ?? '';
        profileData.bState = GlobalData.updateProfileRequest.bState ?? '';
        profileData.bPhone = GlobalData.updateProfileRequest.bPhone ?? '';
        profileData.bLastname = GlobalData.updateProfileRequest.bLastname ?? '';
        profileData.bFirstname =
            GlobalData.updateProfileRequest.bFirstname ?? '';
        profileData.bCity = GlobalData.updateProfileRequest.bCity ?? '';
        profileData.bCountry = GlobalData.updateProfileRequest.bCountry ?? '';
        profileData.bZipcode = GlobalData.updateProfileRequest.bZipcode ?? '';
        profileData.shipToAnother =
            GlobalData.updateProfileRequest.shipToAnother ?? 0;
        profileData.bEmail = '';

        createProfileRequest.userData = profileData;
        multipleProfilesBloc
            ?.add(MultipleProfileAddProfileEvent(createProfileRequest));
        isProfileAdding = true;
      }
    }
  }

  Widget buildMainUI() {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: isLoading
              ? Container()
              : Column(
                  children: [
                    HorizontalCustomStepper(
                      curStep: _curStep,
                      titles: titles,
                      color: Colors.black,
                      activeImages: activeIcons,
                      inactiveImages: inactiveIcons,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppSizes.extraPadding,
                                  top: AppSizes.normalPadding,
                                  bottom: AppSizes.normalPadding),
                              child: Text(
                                  GenericMethods.getStringValue(
                                      context, AppStringConstant.profile),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontFamily: 'SF-Pro-Display')),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    multipleProfilesResponse?.users?.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        isNewCreated = false;
                                        selectedProfile =
                                            multipleProfilesResponse
                                                ?.users?[selectedIndex];
                                      });
                                    },
                                    child: ProfileCard(
                                      index: index,
                                      selectedIndex: selectedIndex,
                                      profileUserModel: multipleProfilesResponse
                                          ?.users?[index],
                                    ),
                                  );
                                }),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.extraPadding),
                              child: commonButton(context, () {
                                setState(() {
                                  isNewCreated = true;
                                  GlobalData.updateProfileRequest =
                                      UpdateProfileRequest.empty();
                                  selectedProfile = ProfileUserModel.empty();
                                });
                              },
                                  GenericMethods.getStringValue(context,
                                      AppStringConstant.createNewProfile),
                                  borderRadius: 12,
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF-Pro-Display',
                                      color: AppColors.white),
                                  height: AppSizes.width / 7),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.all(AppSizes.extraPadding),
                              child: BillingAddressWidget(
                                  selectedProfile,
                                  multipleProfilesResponse?.countryList,
                                  isNewCreated,
                                  dataUpdate),
                            ),
                            SizedBox(
                              height: AppSizes.width / 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        Visibility(
          visible: !isLoading,
          child: Positioned(
            bottom: AppSizes.sidePadding,
            right: AppSizes.sidePadding,
            left: AppSizes.sidePadding,
            child: commonButton(context, () {
              validateAddressForm();
            }, GenericMethods.getStringValue(context, AppStringConstant.save),
                textColor: AppColors.white,
                borderRadius: 12,
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF-Pro-Display',
                    color: AppColors.white),
                height: AppSizes.width / 7),
          ),
        ),
        Visibility(visible: isLoading || isProfileAdding, child: const Loader())
      ],
    );
  }
}
