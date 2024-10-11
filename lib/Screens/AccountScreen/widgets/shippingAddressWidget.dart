import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../CustomWidgets/commonSpinner.dart';
import '../../../CustomWidgets/commonTextField.dart';
import '../../../CustomWidgets/stateSpinner.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/globalData.dart';
import '../../../Models/AccountModels/Response/countryList.dart';
import '../../../Models/AccountModels/Response/profiles.dart';
import '../../../Models/AccountModels/Response/stateData.dart';
import '../../../Utils/validator.dart';

class ShippingAddressWidget extends StatefulWidget {
  Profiles? selectedProfile;
  List<CountryList>? countryList;

  ShippingAddressWidget(this.selectedProfile, this.countryList, {super.key});

  @override
  State<ShippingAddressWidget> createState() => _ShippingAddressWidgetState();
}

class _ShippingAddressWidgetState extends State<ShippingAddressWidget> {
  CountryList? selectedShippingCountry;
  StateData? selectedShippingState;
  bool haveShippingState = false;
  bool dataUpdate = true;

  late TextEditingController shippingPhoneController,
      shippingFirstNameController,
      shippingLastNameController,
      shippingAddressController,
      shippingCityController,
      shippingStateController,
      shippingIndexController;

  void filterSelectedCountryState() {
    if (selectedShippingCountry != null) {
      if ((selectedShippingCountry?.stateList ?? []).isNotEmpty) {
        haveShippingState = true;
      } else {
        haveShippingState = false;
      }
    } else {
      if (widget.selectedProfile?.bCountry != null) {
        for (CountryList cou in widget.countryList ?? []) {
          if (cou.countryCode == widget.selectedProfile?.bCountry) {
            widget.selectedProfile?.bCountry = null;
            selectedShippingCountry = cou;
            if ((selectedShippingCountry?.stateList ?? []).isNotEmpty) {
              haveShippingState = true;
              for (StateData state
                  in selectedShippingCountry?.stateList ?? []) {
                if (state.stateCode == widget.selectedProfile?.bState) {
                  widget.selectedProfile?.bState = null;
                  selectedShippingState = state;
                  break;
                }
              }
            } else {
              haveShippingState = false;
            }
            break;
          }
        }
      }
    }
  }

  void setData() {
    // shipping Address controllers
    shippingPhoneController =
        TextEditingController(text: widget?.selectedProfile?.sPhone ?? "");
    shippingFirstNameController =
        TextEditingController(text: widget?.selectedProfile?.sFirstname ?? "");
    shippingLastNameController =
        TextEditingController(text: widget?.selectedProfile?.sLastname ?? "");
    shippingAddressController =
        TextEditingController(text: widget?.selectedProfile?.sAddress ?? "");
    shippingCityController =
        TextEditingController(text: widget?.selectedProfile?.sCity ?? "");
    shippingStateController =
        TextEditingController(text: widget?.selectedProfile?.sState ?? "");
    shippingIndexController =
        TextEditingController(text: widget?.selectedProfile?.sZipcode ?? "");
  }

  void countryCallback(CountryList? countryList, bool hasStates) {
    setState(() {
      selectedShippingCountry = countryList;
      haveShippingState = hasStates;
      dataUpdate = false;
    });
  }

  void stateCallback(StateData? stateData) {
    setState(() {
      selectedShippingState = stateData;
      dataUpdate = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filterSelectedCountryState();
    if (dataUpdate) {
      setData();
    }
    GlobalData.updateProfileRequest.sCountry =
        selectedShippingCountry?.countryCode;
    GlobalData.updateProfileRequest.sState = selectedShippingState?.stateCode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppSizes.sidePadding),
          child: Text(
              GenericMethods.getStringValue(
                  context, AppStringConstant.shippingAddress),
              style: const TextStyle(
                  fontFamily: 'SF-Pro-Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSizes.sidePadding),
          child: CommonTextField(
            controller: shippingFirstNameController,
            isPassword: false,
            hint: GenericMethods.getStringValue(
                context, AppStringConstant.firstName),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: false,
            onSave: (value) {
              GlobalData.updateProfileRequest.sFirstName = value;
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
            controller: shippingLastNameController,
            isPassword: false,
            hint: GenericMethods.getStringValue(
                context, AppStringConstant.lastName),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: false,
            onSave: (value) {
              GlobalData.updateProfileRequest.sLastName = value;
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
            controller: shippingPhoneController,
            isPassword: false,
            hint:
                GenericMethods.getStringValue(context, AppStringConstant.phone),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: true,
            onSave: (value) {
              GlobalData.updateProfileRequest.sPhone = value;
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(context, AppStringConstant.phone)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
              }

              if (Validator.isValidPhoneNumber(value, context) != null) {
                return Validator.isValidPhoneNumber(value, context) ?? "";
              }
            },
            title:
                GenericMethods.getStringValue(context, AppStringConstant.phone),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSizes.sidePadding),
          child: CommonTextField(
            controller: shippingAddressController,
            isPassword: false,
            hint: GenericMethods.getStringValue(
                context, AppStringConstant.address),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: false,
            onSave: (value) {
              GlobalData.updateProfileRequest.sAddress = value;
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
            child: CountrySpinner(
                widget?.countryList, selectedShippingCountry, countryCallback)),
        Visibility(
            visible: haveShippingState,
            child: Padding(
              padding: const EdgeInsets.only(top: AppSizes.sidePadding),
              child: StateSpinner(selectedShippingCountry?.stateList,
                  selectedShippingState, stateCallback),
            )),
        Visibility(
          visible: !haveShippingState,
          child: Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: CommonTextField(
              controller: shippingStateController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.region),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.updateProfileRequest.sState = value;
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
            controller: shippingCityController,
            isPassword: false,
            hint:
                GenericMethods.getStringValue(context, AppStringConstant.city),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: false,
            onSave: (value) {
              GlobalData.updateProfileRequest.sCity = value;
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(context, AppStringConstant.city)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
              }
            },
            title:
                GenericMethods.getStringValue(context, AppStringConstant.city),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSizes.sidePadding),
          child: CommonTextField(
            controller: shippingIndexController,
            isPassword: false,
            hint:
                GenericMethods.getStringValue(context, AppStringConstant.index),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: false,
            onSave: (value) {
              GlobalData.updateProfileRequest.sZipcode = value;
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(context, AppStringConstant.index)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
              }
            },
            title:
                GenericMethods.getStringValue(context, AppStringConstant.index),
          ),
        ),
      ],
    );
  }
}
