import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../Constants/appConstants.dart';
import '../../../../../Helper/storageHelper.dart';
import '../../../../../Models/AccountModels/Request/createProfileRequest.dart';
import '../../../../../Models/CheckoutModels/LoginUser/Request/updateProfileCheckoutRequest.dart';
import '../../../../../Models/MultipleProfilesModel/response/multipleProfileResponse.dart';
import '../../../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import '../../../../../Models/baseResponse/base_response.dart';
import '../../../../../NetworkManager/api_client.dart';

abstract class MultipleProfilesRepository {
  Future<MultipleProfilesResponse>? getMultipleUserProfileData();

  Future<ShippingMethodModel>? updateProfile(
      UpdateProfileCheckoutRequest updateProfileCheckoutRequest);

  Future<ShippingMethodModel>? addProfile(CreateProfileRequest createProfileRequest);
}

class MultipleProfilesRepositoryImp extends MultipleProfilesRepository {
  @override
  Future<MultipleProfilesResponse> getMultipleUserProfileData() async {
    return await ApiClient(baseUrl: storageController.getStoreData()?.url ?? '')
        .getMultipleProfilesData(
            (storageController.getUserData()?.userId??'').toString() ?? '',
            storageController.getCurrentLanguage(),
            storageController.getCurrentCurrency(),storageController.getStoreData()?.storefrontId??"");
  }

  @override
  Future<ShippingMethodModel>? addProfile(CreateProfileRequest createProfileRequest) async {
    createProfileRequest.storefrontId=storageController.getStoreData()?.storefrontId??"";

    debugPrint('===> ${jsonEncode(createProfileRequest)}');
    return await ApiClient(baseUrl: storageController.getStoreData()?.url ?? '')
        .addProfileForCheckout(
            ApiConstant.authToken, "application/json", createProfileRequest);
  }

  @override
  Future<ShippingMethodModel>? updateProfile(
      UpdateProfileCheckoutRequest updateProfileCheckoutRequest) async {
    updateProfileCheckoutRequest.storefrontId=storageController.getStoreData()?.storefrontId??"";
    return await ApiClient(baseUrl: storageController.getStoreData()?.url ?? '')
        .checkoutUpdateProfile(
            ApiConstant.authToken,
            "application/json",
            (storageController.getUserData()?.userId??'').toString() ?? '',
            updateProfileCheckoutRequest);
  }
}
