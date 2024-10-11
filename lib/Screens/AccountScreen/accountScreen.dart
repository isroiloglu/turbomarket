import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/dialogHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/createProfileRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/updateProfileRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Response/accountDetailResponse.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/bloc/accountScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/bloc/accountScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/bloc/accountScreenStates.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/widgets/addressWidget.dart';

import '../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/appStringConstants.dart';
import '../../CustomWidgets/CommonButton.dart';
import '../../CustomWidgets/commonTextField.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/globalData.dart';
import '../../Models/AccountModels/Request/profileData.dart';
import '../../Models/AccountModels/Response/profiles.dart';
import '../../Utils/validator.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late TextEditingController nameController,
      phoneController,
      emailController,
      passwordController,
      confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  Profiles? selectedProfile;

  bool isLoading = false;
  bool isDeleteAccountLoading = false;
  bool isProfileAdding = false;
  AccountScreenBloc? accountScreenBloc;
  AccountDetailResponse? accountDetailResponse;
  bool isNewCreated = false;
  bool updateData = false;

  @override
  void initState() {
    GlobalData.updateProfileRequest = UpdateProfileRequest.empty();
    nameController = TextEditingController(
        text:
            "${storageController.getUserData()?.firstname ?? ""} ${storageController.getUserData()?.firstname ?? ""}");
    phoneController = TextEditingController(
        text: (storageController.getUserData()?.phone ?? ""));
    emailController = TextEditingController(
        text: (storageController.getUserData()?.email ?? ""));
    passwordController =
        TextEditingController(text: storageController.getPassword());
    confirmPasswordController =
        TextEditingController(text: storageController.getPassword());

    accountScreenBloc = context.read<AccountScreenBloc>();
    accountScreenBloc?.add(AccountScreenFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        backgroundColor: MobikulTheme.lightGreyTest,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.appBarSize),
          child: commonAppBar(context, false, "", true, isFromAccount: true,
              callback: (value) {
            print(value);
            isDeleteAccountLoading = true;
            accountScreenBloc?.add(AccountLoginEvent(
                storageController.getUserData()?.email ?? '', value));
            print(value);
          }),
        ),
        body: SafeArea(child: buildMainUI(context)));
  }

  buildMainUI(BuildContext context) {
    return BlocBuilder<AccountScreenBloc, AccountScreenState>(
        builder: (context, currentState) {
      if (currentState is AccountScreenInitialState) {
        if (isDeleteAccountLoading) {
          // isLoading = true;
        } else if (accountDetailResponse != null) {
          isLoading = false;
        } else {
          isLoading = true;
        }
      } else if (currentState is AccountScreenSuccessState) {
        isLoading = false;
        isProfileAdding = false;
        accountDetailResponse = currentState.accountDetailResponse;
        if (accountDetailResponse?.profileList != null &&
            (accountDetailResponse?.profileList ?? []).isNotEmpty) {
          selectedProfile = accountDetailResponse?.profileList?[0];
        }
      } else if (currentState is AccountScreenReloadState) {
        isLoading = false;
        isProfileAdding = false;
        accountDetailResponse = currentState.accountDetailResponse;
        if (accountDetailResponse?.profileList != null &&
            (accountDetailResponse?.profileList ?? []).isNotEmpty) {
          selectedProfile = accountDetailResponse?.profileList?[0];
        }
      } else if (currentState is AccountScreenProfileSuccessState) {
        isProfileAdding = true;
        if (currentState.baseResponse?.success ?? false) {
          accountScreenBloc?.add(AccountScreenReloadEvent());
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            AlertMessage.showSuccess(
                currentState.baseResponse?.msg ?? '', context);
          });
        } else {
          isProfileAdding = false;
          isLoading = false;
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            AlertMessage.showError(
                currentState.baseResponse?.msg ?? '', context);
          });
        }
      } else if (currentState is AccountScreenErrorState) {
        isLoading = false;
        isProfileAdding = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message ?? '', context);
        });
      } else if (currentState is AccountLoginState) {
        var model = currentState.data;

        if (model.error ?? false) {
          isLoading = false;
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            AlertMessage.showError(currentState.data.message ?? "", context);
          });
        } else {
          accountScreenBloc?.add(AccountDeleteEvent(
              storageController.getUserData()?.userId ?? ''));
        }
      } else if (currentState is DeleteAccountSuccess) {
        isLoading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showSuccess(
              currentState.baseResponse?.message ?? "", context);
        });
        GlobalData.selectedIndex = 0;
        storageController.logoutUser();
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(
              context, bottomNavigation, (route) => false);
        });
      }
      accountScreenBloc?.emit(AccountScreenEmptyState());
      return buildMainUi(context);
    });
  }

  void validateAddressForm() {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() == true) {
      GenericMethods.hideSoftKeyBoard();
      if (!isNewCreated) {
        // editing selected profile

        GlobalData.updateProfileRequest.profileId = selectedProfile?.id;
        GlobalData.updateProfileRequest.langCode =
            storageController.getCurrentLanguage();
        GlobalData.updateProfileRequest.companyId =
            accountDetailResponse?.companyId;
        GlobalData.updateProfileRequest.selectGdprAgreement = "Y";
        GlobalData.updateProfileRequest.userId = accountDetailResponse?.userId;
        GlobalData.updateProfileRequest.userType =
            accountDetailResponse?.userType;
        GlobalData.updateProfileRequest.storefrontId =
            (storageController.getStoreData()?.storefrontId ?? "");
        if (storageController.getPassword() != GlobalData.tempPassword) {
          GlobalData.updateProfileRequest.password1 = GlobalData.tempPassword;
          GlobalData.updateProfileRequest.password2 = GlobalData.tempPassword;
        } else {
          GlobalData.updateProfileRequest.password1 = "";
          GlobalData.updateProfileRequest.password2 = "";
        }
        debugPrint('-----> ${jsonEncode(GlobalData.updateProfileRequest)}');
        accountScreenBloc?.add(AccountScreenUpdateProfile(
            accountDetailResponse?.userId ?? "",
            GlobalData.updateProfileRequest));
        isProfileAdding = true;
        print("UPDATE PROFILE LIST${GlobalData.updateProfileRequest}");
        updateData = true;
      } else {
        //  creating new profile
        CreateProfileRequest createProfileRequest =
            CreateProfileRequest.empty();
        createProfileRequest.langCode = storageController.getCurrentLanguage();
        ProfileData profileData = ProfileData.empty();
        profileData.userId = accountDetailResponse?.userId ?? "";
        profileData.profileName =
            GlobalData.updateProfileRequest.profileName ?? '';
        profileData.bAddress = GlobalData.updateProfileRequest.bAddress ?? '';
        profileData.sState = GlobalData.updateProfileRequest.sState ?? '';
        profileData.sPhone = GlobalData.updateProfileRequest.sPhone ?? '';
        profileData.sLastname = GlobalData.updateProfileRequest.sLastName ?? '';
        profileData.sFirstname =
            GlobalData.updateProfileRequest.sFirstName ?? '';
        profileData.sCountry = GlobalData.updateProfileRequest.sCountry ?? '';
        profileData.sCity = GlobalData.updateProfileRequest.sCity ?? '';
        profileData.sAddress = GlobalData.updateProfileRequest.sAddress ?? '';
        profileData.profileMailingLis1 = true;
        profileData.sZipcode = GlobalData.updateProfileRequest.bZipcode ?? '';
        profileData.bState = GlobalData.updateProfileRequest.bState ?? '';
        profileData.bPhone = GlobalData.updateProfileRequest.bPhone ?? '';
        profileData.bLastname = GlobalData.updateProfileRequest.bLastname ?? '';
        profileData.bFirstname = GlobalData.updateProfileRequest.bFirstname;
        profileData.bCity = GlobalData.updateProfileRequest.bCity ?? '';
        profileData.bCountry = GlobalData.updateProfileRequest.bCountry ?? '';
        profileData.bZipcode = GlobalData.updateProfileRequest.bZipcode ?? '';
        profileData.shipToAnother =
            GlobalData.updateProfileRequest.shipToAnother ?? 0;
        createProfileRequest.userData = profileData;
        accountScreenBloc
            ?.add(AccountScreenAddProfileEvent(createProfileRequest));
        isProfileAdding = true;
        print("CREATE PROFILE LIST${profileData.toJson().toString()}");
        //  print("CREATE PROFILE LIST${createProfileRequest.toJson()}");
      }
    }
  }

  Widget buildMainUi(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.sidePadding),
            child: Form(
              key: _formKey,
              child: isLoading
                  ? Container()
                  : Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: AppSizes.sidePadding),
                          child: CommonTextField(
                            controller: emailController,
                            isPassword: false,
                            hint: GenericMethods.getStringValue(
                                context, AppStringConstant.email),
                            maxLine: 1,
                            minLine: 1,
                            isEmail: true,
                            isPhone: false,
                            onSave: (value) {
                              GlobalData.updateProfileRequest.email =
                                  value.toString();
                            },
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return "${GenericMethods.getStringValue(context, AppStringConstant.email)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                              }

                              if (Validator.isEmailValid(value, context) !=
                                  null) {
                                return Validator.isEmailValid(value, context) ??
                                    "";
                              }
                            },
                            title: GenericMethods.getStringValue(
                                context, AppStringConstant.email),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: AppSizes.sidePadding),
                          child: CommonTextField(
                            controller: phoneController,
                            isPassword: false,
                            hint: GenericMethods.getStringValue(
                                context, AppStringConstant.phone),
                            maxLine: 1,
                            minLine: 1,
                            isEmail: false,
                            isPhone: true,
                            onSave: (value) {
                              GlobalData.updateProfileRequest.phone =
                                  value.toString();
                            },
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return "${GenericMethods.getStringValue(context, AppStringConstant.phone)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                              }

                              if (Validator.isValidPhoneNumber(
                                      value, context) !=
                                  null) {
                                return Validator.isValidPhoneNumber(
                                        value, context) ??
                                    "";
                              }
                            },
                            title: GenericMethods.getStringValue(
                                context, AppStringConstant.phone),
                          ),
                        ),
                        Visibility(
                          visible: !(storageController.getSocialLoginStatus() ??
                              false),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: AppSizes.sidePadding),
                            child: CommonTextField(
                              controller: passwordController,
                              isPassword: true,
                              hint: GenericMethods.getStringValue(
                                  context, AppStringConstant.password),
                              maxLine: 1,
                              minLine: 1,
                              showPasswordButton: true,
                              isEmail: false,
                              isPhone: false,
                              onSave: (value) {
                                GlobalData.tempPassword = value.toString();
                                GlobalData.updateProfileRequest.password1 =
                                    value.toString();
                              },
                              validator: (value) {
                                if (value == null || value.toString().isEmpty) {
                                  return "${GenericMethods.getStringValue(context, AppStringConstant.password)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                                }

                                if (value.toString().length < 6) {
                                  return GenericMethods.getStringValue(context,
                                      AppStringConstant.digitPasswordRequired);
                                }
                              },
                              title: GenericMethods.getStringValue(
                                  context, AppStringConstant.password),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !(storageController.getSocialLoginStatus() ??
                              false),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: AppSizes.sidePadding),
                            child: CommonTextField(
                              controller: confirmPasswordController,
                              isPassword: true,
                              hint: GenericMethods.getStringValue(
                                  context, AppStringConstant.confirmPassword),
                              maxLine: 1,
                              minLine: 1,
                              showPasswordButton: true,
                              isEmail: false,
                              isPhone: false,
                              onSave: (value) {
                                GlobalData.updateProfileRequest.password2 =
                                    value.toString();
                              },
                              validator: (value) {
                                if (value == null || value.toString().isEmpty) {
                                  return "${GenericMethods.getStringValue(context, AppStringConstant.confirmPassword)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                                }

                                if (passwordController.text != value) {
                                  return GenericMethods.getStringValue(context,
                                      AppStringConstant.passwordMismatch);
                                }
                              },
                              title: GenericMethods.getStringValue(
                                  context, AppStringConstant.confirmPassword),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: AppSizes.size30),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: AppSizes.size30),
                          child: multipleProfileUI(),
                        ),
                      ],
                    ),
            ),
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
                fontWeight: FontWeight.w600,
                height: AppSizes.width / 7),
          ),
        ),
        Visibility(visible: isLoading || isProfileAdding, child: const Loader())
      ],
    );
  }

  Widget multipleProfileUI() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            GenericMethods.getStringValue(
                context, AppStringConstant.multipleProfileMessage),
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: AppSizes.normalPadding,
          ),
          Text(
            GenericMethods.getStringValue(
                context, AppStringConstant.selectProfile),
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (accountDetailResponse?.profileList ?? []).length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  visualDensity:
                      const VisualDensity(horizontal: -4.0, vertical: -3.0),
                  activeColor: MobikulTheme.clientPrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          accountDetailResponse
                                  ?.profileList?[index].profileName ??
                              "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w500)),
                      Visibility(
                        visible: (accountDetailResponse
                                    ?.profileList?[index].profileType ??
                                "") ==
                            "S",
                        child: GestureDetector(
                          onTap: () {
                            DialogHelper.confirmationDialog(
                                GenericMethods.getStringValue(
                                    context, AppStringConstant.warningMessage),
                                context, onConfirm: () {
                              accountScreenBloc?.add(
                                  AccountScreenDeleteProfileEvent(
                                      (accountDetailResponse
                                              ?.profileList?[index].id) ??
                                          ''));
                              isProfileAdding = true;
                            });
                          },
                          child: Text(
                            GenericMethods.getStringValue(
                                context, AppStringConstant.delete),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.debitRed,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      )
                    ],
                  ),
                  selected: selectedProfile ==
                      accountDetailResponse?.profileList?[index],
                  value: accountDetailResponse?.profileList?[index] ??
                      Profiles.empty(),
                  groupValue: selectedProfile,
                  onChanged: (Profiles? value) {
                    setState(() {
                      GlobalData.updateProfileRequest =
                          UpdateProfileRequest.empty();
                      isNewCreated = false;
                      selectedProfile = value;
                    });
                  },
                );
              }),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.widgetSidePadding),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isNewCreated = true;
                  GlobalData.updateProfileRequest =
                      UpdateProfileRequest.empty();
                  selectedProfile = Profiles.empty();
                });
              },
              child: Text(
                  GenericMethods.getStringValue(
                      context, AppStringConstant.createNewProfile),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: MobikulTheme.clientPrimaryColor,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.size30),
            child: AddressWidget(selectedProfile,
                accountDetailResponse?.countryList, isNewCreated, updateData),
          ),
          SizedBox(
            height: AppSizes.width / 5,
          )
        ],
      ),
    );
  }
}
