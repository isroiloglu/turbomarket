import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Response/countryList.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/MultipleProfilesModel/profileUserModel.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/AccountScreen/widgets/shippingAddressWidget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/AddressScreen/widgets/checkoutShippingAddressWidget.dart';

import '../../../../Config/theme.dart';
import '../../../../Constants/appConstants.dart';
import '../../../../Constants/appStringConstants.dart';
import '../../../../CustomWidgets/commonSpinner.dart';
import '../../../../CustomWidgets/commonTextField.dart';
import '../../../../CustomWidgets/stateSpinner.dart';
import '../../../../Helper/genericMethods.dart';
import '../../../../Helper/globalData.dart';
import '../../../../Models/AccountModels/Response/stateData.dart';
import '../../../../Utils/validator.dart';

class BillingAddressWidget extends StatefulWidget {
  ProfileUserModel? selectedProfile;
  List<CountryList>? countryList;
  bool isNew;
  bool dataUpdate;

  BillingAddressWidget(
      this.selectedProfile, this.countryList, this.isNew, this.dataUpdate,
      {Key? key})
      : super(key: key);

  @override
  State<BillingAddressWidget> createState() => _BillingAddressWidgetState();
}

class _BillingAddressWidgetState extends State<BillingAddressWidget> {
  bool billingShippingSame = true;
  bool haveBillingState = false;
  CountryList? selectedBillingCountry;
  StateData? selectedBillingState;
  bool dataUpdate = true;

  late TextEditingController profileNameController,
      phoneController,
      firstNameController,
      lastNameController,
      addressController,
      cityController,
      stateController,
      indexController;

  void filterSelectedCountryState() {
    if (selectedBillingCountry != null) {
      if ((selectedBillingCountry?.stateList ?? []).isNotEmpty) {
        haveBillingState = true;
      } else {
        haveBillingState = false;
      }
    } else {
      if (widget.selectedProfile?.bCountry != null) {
        for (CountryList cou in widget.countryList ?? []) {
          if (cou.countryCode == widget.selectedProfile?.bCountry) {
            widget.selectedProfile?.bCountry = null;
            selectedBillingCountry = cou;
            if ((selectedBillingCountry?.stateList ?? []).isNotEmpty) {
              haveBillingState = true;
              for (StateData state in selectedBillingCountry?.stateList ?? []) {
                if (state.stateCode == widget.selectedProfile?.bState) {
                  widget.selectedProfile?.bState = null;
                  selectedBillingState = state;
                  break;
                }
              }
            } else {
              haveBillingState = false;
            }
            break;
          }
        }
      }
    }
  }

  void setData() {
    // billing Address Controllers
    if (widget.isNew) {
      profileNameController = TextEditingController();
      firstNameController = TextEditingController();
      lastNameController = TextEditingController();
      addressController = TextEditingController();
      cityController = TextEditingController();
      stateController = TextEditingController();
      indexController = TextEditingController();
      phoneController = TextEditingController();
      dataUpdate = false;
    } else if (!widget.dataUpdate) {
      profileNameController = TextEditingController(
          text: widget?.selectedProfile?.profileName ?? "");
      firstNameController = TextEditingController(
          text: widget?.selectedProfile?.bFirstname ?? "");
      lastNameController =
          TextEditingController(text: widget?.selectedProfile?.bLastname ?? "");
      addressController =
          TextEditingController(text: widget?.selectedProfile?.bAddress ?? "");
      cityController =
          TextEditingController(text: widget?.selectedProfile?.bCity ?? "");
      stateController =
          TextEditingController(text: widget?.selectedProfile?.bState ?? "");
      indexController =
          TextEditingController(text: widget?.selectedProfile?.bZipcode ?? "");
      phoneController =
          TextEditingController(text: widget?.selectedProfile?.bPhone ?? "");
      dataUpdate = true;
    }
  }

  void billingCountryCallback(CountryList? countryList, bool hasStates) {
    setState(() {
      selectedBillingCountry = countryList;
      haveBillingState = hasStates;
      dataUpdate = false;
    });
  }

  void stateCallback(StateData? stateData) {
    setState(() {
      selectedBillingState = stateData;
      dataUpdate = false;
    });
  }

  @override
  void initState() {
    billingShippingSame = true;
    GlobalData.updateProfileRequest.shipToAnother = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filterSelectedCountryState();
    if (dataUpdate || !(widget.isNew)) {
      setData();
    }
    GlobalData.updateProfileRequest.bCountry =
        selectedBillingCountry?.countryCode;
    GlobalData.updateProfileRequest.bState = selectedBillingState?.stateCode;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizes.size20),
          CommonTextField(
            controller: profileNameController,
            isPassword: false,
            hint: GenericMethods.getStringValue(
                context, AppStringConstant.profileName),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: false,
            onSave: (value) {
              GlobalData.updateProfileRequest.profileName = value.toString();
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(context, AppStringConstant.profileName)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
              }
            },
            title: GenericMethods.getStringValue(
                context, AppStringConstant.profileName),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: Text(
                GenericMethods.getStringValue(
                    context, AppStringConstant.billingAddress),
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'SF-Pro-Display')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: CommonTextField(
              controller: firstNameController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.firstName),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.updateProfileRequest.bFirstname = value.toString();
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "${GenericMethods.getStringValue(context, AppStringConstant.firstName)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                }
              },
              title: GenericMethods.getStringValue(
                  context, AppStringConstant.firstName),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: CommonTextField(
              controller: lastNameController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.lastName),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.updateProfileRequest.bLastname = value.toString();
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "${GenericMethods.getStringValue(context, AppStringConstant.lastName)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                }
              },
              title: GenericMethods.getStringValue(
                  context, AppStringConstant.lastName),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
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
                GlobalData.updateProfileRequest.bPhone = value.toString();
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "${GenericMethods.getStringValue(context, AppStringConstant.phone)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                }

                if (Validator.isValidPhoneNumber(value, context) != null) {
                  return Validator.isValidPhoneNumber(value, context) ?? "";
                }
              },
              title: GenericMethods.getStringValue(
                  context, AppStringConstant.phone),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: CommonTextField(
              controller: addressController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.address),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.updateProfileRequest.bAddress = value.toString();
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "${GenericMethods.getStringValue(context, AppStringConstant.address)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                }
              },
              title: GenericMethods.getStringValue(
                  context, AppStringConstant.address),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: AppSizes.sidePadding),
              child: CountrySpinner(widget?.countryList, selectedBillingCountry,
                  billingCountryCallback)),
          Visibility(
              visible: haveBillingState,
              child: Padding(
                padding: const EdgeInsets.only(top: AppSizes.sidePadding),
                child: StateSpinner(selectedBillingCountry?.stateList,
                    selectedBillingState, stateCallback),
              )),
          Visibility(
            visible: !haveBillingState,
            child: Padding(
              padding: const EdgeInsets.only(top: AppSizes.sidePadding),
              child: CommonTextField(
                controller: stateController,
                isPassword: false,
                hint: GenericMethods.getStringValue(
                    context, AppStringConstant.region),
                maxLine: 1,
                minLine: 1,
                isEmail: false,
                isPhone: false,
                onSave: (value) {
                  GlobalData.updateProfileRequest.bState = value.toString();
                },
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return "${GenericMethods.getStringValue(context, AppStringConstant.region)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                  }
                },
                title: GenericMethods.getStringValue(
                    context, AppStringConstant.region),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: CommonTextField(
              controller: cityController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.city),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.updateProfileRequest.bCity = value.toString();
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "${GenericMethods.getStringValue(context, AppStringConstant.city)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                }
              },
              title: GenericMethods.getStringValue(
                  context, AppStringConstant.city),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: CommonTextField(
              controller: indexController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.index),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.updateProfileRequest.bZipcode = value.toString();
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "${GenericMethods.getStringValue(context, AppStringConstant.index)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                }
              },
              title: GenericMethods.getStringValue(
                  context, AppStringConstant.index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                      GenericMethods.getStringValue(
                              context, AppStringConstant.billingShippingSame)
                          .toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700)),
                ),
                Expanded(
                  flex: 1,
                  child: Switch(
                      value: billingShippingSame,
                      activeColor: MobikulTheme.clientPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          billingShippingSame = value;
                        });
                        GlobalData.updateProfileRequest.shipToAnother =
                            value == true ? 0 : 1;
                      }),
                )
              ],
            ),
          ),
          Visibility(
            visible: billingShippingSame == false,
            child: CheckoutShippingAddressWidget(
                widget.selectedProfile, widget.countryList),
          ),
        ],
      ),
    );
  }
}
