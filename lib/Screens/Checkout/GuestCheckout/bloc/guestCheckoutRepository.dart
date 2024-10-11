import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../Constants/appConstants.dart';
import '../../../../Helper/storageHelper.dart';
import '../../../../Models/CheckoutModels/GuestCheckout/Request/submitDataRequest.dart';
import '../../../../Models/CheckoutModels/GuestCheckout/Response/guestProfileData.dart';
import '../../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import '../../../../Models/baseResponse/base_response.dart';
import '../../../../NetworkManager/api_client.dart';

abstract class GuestCheckoutRepository{
  Future<GuestProfileData> getGuestProfileData();
  Future<ShippingMethodModel> submitGuestData(SubmitUserDataRequest? submitUserDataRequest);
}

class GuestCheckoutRepositoryImp extends GuestCheckoutRepository{
  @override
  Future<GuestProfileData> getGuestProfileData() async{
    return await ApiClient(baseUrl: storageController.getStoreData()?.url??'').getGuestProfileData(ApiConstant.authToken,
        "application/json",(storageController.getUserData()?.userId??'').toString()??'',storageController.getCurrentLanguage(),storageController.getCurrentCurrency(),storageController.getStoreData()?.storefrontId??"");
  }

  @override
  Future<ShippingMethodModel> submitGuestData(SubmitUserDataRequest? submitUserDataRequest) async{
    debugPrint("data======> ${jsonEncode(submitUserDataRequest)}");
    return await ApiClient(baseUrl: storageController.getStoreData()?.url??'').updateGuestData(ApiConstant.authToken,
        "application/json",(storageController.getUserData()?.userId??'').toString()??'',submitUserDataRequest!);
  }

}