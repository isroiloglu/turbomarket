

import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';

import '../Constants/appStringConstants.dart';

class Validator {
  static bool isEmpty(String value) {
    return value.isEmpty;
  }

  static String? isEmailValid(String email, BuildContext context) {
    var emailRegExp = RegExp("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+");
    if (isEmpty(email)) {
      return GenericMethods.getStringValue(context,AppStringConstant.emailRequired);
    } else if (!emailRegExp.hasMatch(email)) {
      return GenericMethods.getStringValue(context,AppStringConstant.validEmail);
    }
    return null;
  }

  static String? isValidPassword(String password, BuildContext context) {
    if (isEmpty(password)) {
      return GenericMethods.getStringValue(context, AppStringConstant.passwordRequired);
    } else if (password.trim().length <= 5) {
      return GenericMethods.getStringValue(context,AppStringConstant.invalidPasswordMessage);
    }
    return null;
  }
  static String? isValidPhoneNumber(String phoneNumber, BuildContext context) {
    var phoneRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{11}$)');
    if (isEmpty(phoneNumber)) {
      return GenericMethods.getStringValue(context,AppStringConstant.phoneNumberIsRequired);
    } else if (!phoneRegExp.hasMatch(phoneNumber.trim())) {
      return GenericMethods.getStringValue(context, AppStringConstant.invalidPhoneNumberMessage);
    }
    return null;
  }
}
