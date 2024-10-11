import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Response/countryList.dart';

import '../../../../Constants/appConstants.dart';
import '../../../../Constants/appStringConstants.dart';
import '../../../../CustomWidgets/commonSpinner.dart';
import '../../../../CustomWidgets/commonTextField.dart';
import '../../../../CustomWidgets/stateSpinner.dart';
import '../../../../Helper/genericMethods.dart';
import '../../../../Helper/globalData.dart';
import '../../../../Models/AccountModels/Response/stateData.dart';
import '../../../../Utils/validator.dart';

class GuestShippingAddress extends StatefulWidget {
  List<CountryList>? countryList;
   GuestShippingAddress(this.countryList, {Key? key}) : super(key: key);

  @override
  State<GuestShippingAddress> createState() => _GuestShippingAddressState();
}

class _GuestShippingAddressState extends State<GuestShippingAddress> {
  CountryList? selectedShippingCountry;
  StateData? selectedShippingState;
  bool haveShippingState = false;
  bool dataUpdate=true;


  late TextEditingController
  emailController,
  shippingPhoneController,
      shippingFirstNameController,
      shippingLastNameController,
      shippingAddressController,
      shippingCityController,
      shippingStateController,
      shippingIndexController;

  void setData(){
    // shipping Address controllers
    shippingPhoneController = TextEditingController(text: GlobalData.guestUserData.sPhone??"");
    shippingFirstNameController = TextEditingController(text: GlobalData.guestUserData.sFirstname??"");
    shippingLastNameController = TextEditingController(text: GlobalData.guestUserData.sLastname??"");
    shippingAddressController = TextEditingController(text: GlobalData.guestUserData.sAddress??"");
    shippingCityController = TextEditingController(text: GlobalData.guestUserData.sCity??"");
    shippingStateController = TextEditingController(text: GlobalData.guestUserData.sState??"");
    shippingIndexController = TextEditingController(text: GlobalData.guestUserData.sZipcode??"");
    emailController=TextEditingController(text:"");
  }

  void countryCallback(CountryList? countryList, bool hasStates) {
    setState(() {
      selectedShippingCountry=countryList;
      haveShippingState=hasStates;
      dataUpdate=false;

    });
    GlobalData.guestUserData.sCountry=countryList?.countryCode;
  }
  void stateCallback(StateData? stateData){
    setState(() {
      selectedShippingState=stateData;
      dataUpdate=false;
    });
    GlobalData.guestUserData.sState=stateData?.stateCode;

  }

  @override
  void initState() {
    if(selectedShippingCountry!=null && (selectedShippingCountry?.stateList??[]).isNotEmpty){
      selectedShippingCountry=widget.countryList?[0];
      setState(() {
        selectedShippingState=selectedShippingCountry?.stateList?[0];
        GlobalData.guestUserData.sCountry=selectedShippingCountry?.countryCode??"";
        if(selectedShippingState!=null){
          GlobalData.guestUserData.sState=selectedShippingState?.stateCode??"";
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(dataUpdate){
      setData();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppSizes.sidePadding),
          child: Text(
              GenericMethods.getStringValue(
                  context, AppStringConstant.shippingAddress),
              style: Theme.of(context).textTheme.titleMedium),
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
              GlobalData.guestUserData.sFirstname=value.toString();
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(
                    context, AppStringConstant.firstName)} ${GenericMethods.getStringValue(
                    context, AppStringConstant.isRequired)}";
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
              GlobalData.guestUserData.sLastname=value.toString();
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(
                    context, AppStringConstant.lastName)} ${GenericMethods.getStringValue(
                    context, AppStringConstant.isRequired)}";
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
            hint: GenericMethods.getStringValue(
                context, AppStringConstant.email),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: true,
            onSave: (value) {

            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(
                    context, AppStringConstant.email)} ${GenericMethods.getStringValue(
                    context, AppStringConstant.isRequired)}";
              }

              if (Validator.isEmailValid(value, context) != null) {
                return  Validator.isEmailValid(value, context) ?? "";
              }
            },
            title: GenericMethods.getStringValue(
                context, AppStringConstant.email),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSizes.sidePadding),
          child: CommonTextField(
            controller: shippingPhoneController,
            isPassword: false,
            hint: GenericMethods.getStringValue(
                context, AppStringConstant.phone),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: true,
            onSave: (value) {
              GlobalData.guestUserData.sPhone=value.toString();
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(
                    context, AppStringConstant.phone)} ${GenericMethods.getStringValue(
                    context, AppStringConstant.isRequired)}";
              }

              if (Validator.isValidPhoneNumber(value, context) != null) {
                return  Validator.isValidPhoneNumber(value, context) ?? "";
              }
            },
            title: GenericMethods.getStringValue(
                context, AppStringConstant.phone),
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
              GlobalData.guestUserData.sAddress=value.toString();
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(
                    context, AppStringConstant.address)} ${GenericMethods.getStringValue(
                    context, AppStringConstant.isRequired)}";
              }
            },
            title: GenericMethods.getStringValue(
                context, AppStringConstant.address),
          ),
        ),

        Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: CountrySpinner(widget?.countryList, selectedShippingCountry,
                countryCallback)),
        Visibility(
            visible: haveShippingState,
            child: Padding(
              padding: const EdgeInsets.only(top: AppSizes.sidePadding),
              child: StateSpinner(selectedShippingCountry?.stateList,
                  selectedShippingState, stateCallback),
            )),
        Visibility(
          visible:!haveShippingState,
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
                GlobalData.guestUserData.sState=value.toString();
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "${GenericMethods.getStringValue(
                      context, AppStringConstant.region)} ${GenericMethods.getStringValue(
                      context, AppStringConstant.isRequired)}";
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
            hint: GenericMethods.getStringValue(
                context, AppStringConstant.city),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: false,
            onSave: (value) {
              GlobalData.guestUserData.sCity=value.toString();
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(
                    context, AppStringConstant.city)} ${GenericMethods.getStringValue(
                    context, AppStringConstant.isRequired)}";
              }
            },
            title: GenericMethods.getStringValue(
                context, AppStringConstant.city),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSizes.sidePadding),
          child: CommonTextField(
            controller: shippingIndexController,
            isPassword: false,
            hint: GenericMethods.getStringValue(
                context, AppStringConstant.index),
            maxLine: 1,
            minLine: 1,
            isEmail: false,
            isPhone: false,
            onSave: (value) {
              GlobalData.guestUserData.sZipcode=value.toString();
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return "${GenericMethods.getStringValue(
                    context, AppStringConstant.index)} ${GenericMethods.getStringValue(
                    context, AppStringConstant.isRequired)}";
              }
            },
            title: GenericMethods.getStringValue(
                context, AppStringConstant.index),
          ),
        ),
      ],
    );
  }
}
