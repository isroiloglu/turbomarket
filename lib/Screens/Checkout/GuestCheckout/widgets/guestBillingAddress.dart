import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/CheckoutModels/GuestCheckout/Response/guestProfileData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/GuestCheckout/widgets/guestShippingAddress.dart';

import '../../../../Config/theme.dart';
import '../../../../Constants/appConstants.dart';
import '../../../../Constants/appStringConstants.dart';
import '../../../../CustomWidgets/commonSpinner.dart';
import '../../../../CustomWidgets/commonTextField.dart';
import '../../../../CustomWidgets/stateSpinner.dart';
import '../../../../Helper/genericMethods.dart';
import '../../../../Helper/globalData.dart';
import '../../../../Models/AccountModels/Response/countryList.dart';
import '../../../../Models/AccountModels/Response/stateData.dart';
import '../../../../Utils/validator.dart';

class GuestBillingAddress extends StatefulWidget {
  GuestProfileData? guestProfileData;
   GuestBillingAddress(this.guestProfileData, {Key? key}) : super(key: key);

  @override
  State<GuestBillingAddress> createState() => _GuestBillingAddressState();
}

class _GuestBillingAddressState extends State<GuestBillingAddress> {

  bool billingShippingSame = true;
  bool haveBillingState = false;
  CountryList? selectedBillingCountry;
  StateData? selectedBillingState;
  bool dataUpdate=true;

  late TextEditingController emailController,
      phoneController,
      firstNameController,
      lastNameController,
      addressController,
      cityController,
      stateController,
      indexController;
  
  @override
  void initState() {
    billingShippingSame = true;
    if(selectedBillingCountry!=null && (selectedBillingCountry?.stateList??[]).isNotEmpty){
      setState(() {
        selectedBillingCountry=widget.guestProfileData?.countryList?[0];
        selectedBillingState=selectedBillingCountry?.stateList?[0];
        GlobalData.guestUserData.bCountry=selectedBillingCountry?.countryCode??"";
        if(selectedBillingState!=null){
          GlobalData.guestUserData.bState=selectedBillingState?.stateCode??"";
        }
      });
    }
    super.initState();
  }

  void setData(){
    // billing Address Controllers
    emailController = TextEditingController(text: GlobalData.guestUserData.bEmail??"");
    firstNameController = TextEditingController(text: GlobalData.guestUserData.bFirstname??"");
    lastNameController = TextEditingController(text: GlobalData.guestUserData.bLastname??"");
    addressController = TextEditingController(text: GlobalData.guestUserData.bAddress??"");
    cityController = TextEditingController(text: GlobalData.guestUserData.bCity??"");
    stateController = TextEditingController(text: GlobalData.guestUserData.bState??"");
    indexController = TextEditingController(text: GlobalData.guestUserData.bZipcode??"");
    phoneController = TextEditingController(text: GlobalData.guestUserData.bPhone??"");

  }

  void billingCountryCallback(CountryList? countryList, bool hasStates) {
    setState(() {
      selectedBillingCountry=countryList;
      haveBillingState=hasStates;
      dataUpdate=false;
    });
    GlobalData.guestUserData.bCountry=countryList?.countryCode;
  }

  void stateCallback(StateData? stateData){
    setState(() {
      selectedBillingState=stateData;
      dataUpdate=false;
    });
    GlobalData.guestUserData.bState=stateData?.stateCode;
  }
  
  @override
  Widget build(BuildContext context) {
    if(dataUpdate){
      setData();
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: Text(
                GenericMethods.getStringValue(
                    context, AppStringConstant.billingAddress),
                style: Theme.of(context).textTheme.titleMedium),
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
                GlobalData.guestUserData.bFirstname=value.toString();
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
              controller: lastNameController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.lastName),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.guestUserData.bLastname=value.toString();
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
              controller: emailController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.email),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.guestUserData.bEmail=value.toString();
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "${GenericMethods.getStringValue(
                      context, AppStringConstant.email)} ${GenericMethods.getStringValue(
                      context, AppStringConstant.isRequired)}";
                }

                if (Validator.isEmailValid(value,context) != null) {
                  return  Validator.isEmailValid(value,context) ?? "";
                }
              },
              title: GenericMethods.getStringValue(
                  context, AppStringConstant.email),
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
                GlobalData.guestUserData.bPhone=value.toString();
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "${GenericMethods.getStringValue(
                      context, AppStringConstant.phone)} ${GenericMethods.getStringValue(
                      context, AppStringConstant.isRequired)}";
                }

                if (Validator.isValidPhoneNumber(value, context) != null) {
                  return  Validator.isValidPhoneNumber(value,context) ?? "";
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
                GlobalData.guestUserData.bAddress=value.toString();
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
              child: CountrySpinner(widget?.guestProfileData?.countryList, selectedBillingCountry,
                  billingCountryCallback)),
          Visibility(
              visible: haveBillingState,
              child: Padding(
                padding: const EdgeInsets.only(top: AppSizes.sidePadding),
                child: StateSpinner(selectedBillingCountry?.stateList,
                    selectedBillingState, stateCallback),
              )),
          Visibility(
            visible:!haveBillingState,
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
                  GlobalData.guestUserData.bState=value.toString();
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
              controller: cityController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.city),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.guestUserData.bCity=value.toString();
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
              controller: indexController,
              isPassword: false,
              hint: GenericMethods.getStringValue(
                  context, AppStringConstant.index),
              maxLine: 1,
              minLine: 1,
              isEmail: false,
              isPhone: false,
              onSave: (value) {
                GlobalData.guestUserData.bZipcode=value.toString();
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
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.sidePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                      GenericMethods.getStringValue(context, AppStringConstant.billingShippingSame).toUpperCase(),
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
                        GlobalData.updateProfileRequest.shipToAnother=value==true?0:1;
                      }),
                )
              ],
            ),
          ),
          Visibility(
            visible: billingShippingSame==false,
            child: GuestShippingAddress(widget.guestProfileData?.countryList),
          ),

          const SizedBox(height: AppSizes.size100),

        ],
      ),
    );
  }
}
