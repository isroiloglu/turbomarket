import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/LoginSignupModels/login_response.dart';

import '../Models/StoreSelectionModels/storeFronts.dart';

final storageController = StorageController();

class Preferences {
  Preferences._();
  static const CURRENT_LANGUAGE = 'CURRENT_LANGUAGE';
  static const IS_LOGGED_IN = 'IS_LOGGED_IN';
  static const IS_DARK_MODE = 'IS_DARK_MODE';
  static const TOTAL_PRODUCTS = "TOTAL_PRODUCTS";
  static const Coefficient = "Coefficient";
  static const CURRENT_CURRENCY = "CURRENT_CURRENCY";
  static const USER_EMAIL = "USER_EMAIL";
  static const FIRST_NAME = "FIRST_NAME";
  static const LAST_NAME = "LAST_NAME";
  static const USER_NAME = "USER_NAME";
  static const USER_MOBILE = "USER_MOBILE";
  static const USER_PROFILE_PIC = "USER_PROFILE_PIC";
  static const DEVICE_ID = "DEVICE_ID";
  static const API_TOKEN = "API_TOKEN";
  static const FIREBASE_NOTIFICATION_TOKEN = 'FIREBASE_NOTIFICATION_TOKEN';
  static const LOGGED_IN_EMAIL = "LOGGED_IN_EMAIL";
  static const LOGGED_IN_PASS = "LOGGED_IN_PASS";
  static const CURRENCY_CODE = "CURRENCY_CODE";
  static const CURRENCY_SYMBOL = "CURRENCY_SYMBOL";
  static const Cart_AMOUNT="CART_AMOUNT";
  static const CUSTOMER_TYPE="CUSTOMER_TYPE";
  static const MULTIPLE_PROFILE_ENABLE="MULTIPLE_PROFILE_ENABLE";
  static const IS_VENDOR="IS_VENDOR";
  static const ORDER_TOTAL="ORDER_TOTAL";
  static const BADGE_COUNT="BADGE_COUNT";
  static const THEME_MODE = "THEME_MODE";
  static const PRICE_FILTER = "PRICE_FILTER";
  static const GIFT_CERTIFICATE = "GIFT_CERTIFICATE";
  static const AFTER_COUPAN_CODE_TOTAL = "AFTER_COUPAN_CODE_TOTAL";
  static const PASSWORD="PASSWORD";
  static const LOGINREMINDER="LOGINREMINDER";
  static const ONBOARDING="ONBOARDING";
  static const POINTS="POINTS";
  static const USERDATA="USERDATA";
  static const STOREDATA="STOREDATA";
  static const IS_SOCIAL_LOGIN="IS_SOCIAL_LOGIN";
  static const CATEGORIES="CATEGORIES";
  static const COMPANY_ID="CUSTOMER_ID";
  static const MULTIPLE_PROFILE="MULTIPLE_PROFILE";
  static const GUEST_ID="GUEST_ID";
  static const USED_POINT="USED_POINT";
  static const DELETED_POINT="DELETED_POINT";

}

class StorageController {


  var container = GetStorage('userStorage');
  GetStorage globalStorage = GetStorage("globalStorage");

  init() async {
    await container.initStorage;
    await globalStorage.initStorage;
    return true;
  }

  String getLocale() {
    return globalStorage.read('locale') ?? 'ru';
  }

  setLocale(String newLocale)  {
    globalStorage.write('locale', newLocale);
  }

  bool? getLoginStatus() {
    return globalStorage.read(Preferences.IS_LOGGED_IN) ?? false;
  }

  saveIsLoggedIn(bool value)  {
    globalStorage.write(Preferences.IS_LOGGED_IN, value);
  }

  // String getUserId() {
  //   return container.read("customer_id") ?? "";
  // }
  //
  // setUserId(String? value)  {
  //   container.write("customer_id", value ?? "");
  // }

  String getCompanyId() {
    return globalStorage.read(Preferences.COMPANY_ID) ?? "1";
  }

  setCompanyId(var value)  {
    globalStorage.write(Preferences.COMPANY_ID, value);
  }


  String getFirebaseToken() {
    return globalStorage.read(Preferences.FIREBASE_NOTIFICATION_TOKEN) ?? "";
  }

  setFirebaseToken(String? value)  {
    globalStorage.write(Preferences.FIREBASE_NOTIFICATION_TOKEN, value ?? "");
  }


  String getCurrentLanguage() {
    return globalStorage.read(Preferences.CURRENT_LANGUAGE) ?? "ru";
  }

  setCurrentLanguage(String language)  {
    globalStorage.write(Preferences.CURRENT_LANGUAGE, language);
  }

  String getCurrentCurrency() {
    return globalStorage.read(Preferences.CURRENT_CURRENCY) ?? "UZS";
  }

  setPriceFilter(List range){
    container.write(Preferences.PRICE_FILTER, range);
  }
  List getPriceFilter() {
    return container.read(Preferences.PRICE_FILTER) ?? [];
  }

  setCurrentCurrency(String language)  {
    globalStorage.write(Preferences.CURRENT_CURRENCY, language);
  }


  logoutUser()  {
    saveIsLoggedIn(false);
    container.erase();

  }

  String getOrderTotal() {
    return container.read(Preferences.ORDER_TOTAL) ?? "";
  }

  setOrderTotal(var value)  {
    container.write(Preferences.ORDER_TOTAL, value);
  }

  String getBadgeCount() {
    return (container.read(Preferences.BADGE_COUNT) ?? "0").toString();
  }

  setBadgeCount(var value)  {
    container.write(Preferences.BADGE_COUNT, value);
  }
  setAfterCoupanCodeTotal(String afterCoupanCodeTotal)  {
    container.write(Preferences.AFTER_COUPAN_CODE_TOTAL, afterCoupanCodeTotal);
  }
  String getCoupanCodeTotal() {
    return container.read(Preferences.AFTER_COUPAN_CODE_TOTAL) ?? "";
  }

  //set gift code
  setGiftCode(Set<String> giftCode)async {
    if(giftCode.isNotEmpty){
      await container.write(Preferences.GIFT_CERTIFICATE, jsonEncode(giftCode.toList()));
    }else {
      await container.write(Preferences.GIFT_CERTIFICATE, []);
    }

  }

  HashSet<String> getGiftCode() {
    if(container.read(Preferences.GIFT_CERTIFICATE)!=null && container.read(Preferences.GIFT_CERTIFICATE)!=""&& container.read(Preferences.GIFT_CERTIFICATE).length>0){
      List<dynamic>giftSet= json.decode(container.read(Preferences.GIFT_CERTIFICATE)) as List;
      print("gifts:: $giftSet \n ${HashSet.from(giftSet)}");
      return  HashSet.from(giftSet);
    }else{
      return  HashSet();
    }


  }

  setUsedPoint(String point)async {
    if(point.isNotEmpty){
      await container.write(Preferences.USED_POINT,point);
    }else {
      await container.write(Preferences.USED_POINT, '');
    }
  }

  getUsedPoint() {
    var value = container.read(Preferences.USED_POINT);
    print("used points---$value");
    return value;
  }

  setDeletedPoint(String point)async {
    if(point.isNotEmpty){
      await container.write(Preferences.DELETED_POINT,point);
    }else {
      await container.write(Preferences.DELETED_POINT, '');
    }
  }

  getDeletedPoint() {
    var value = container.read(Preferences.DELETED_POINT);
    print("deleted points---$value");
    return value;
  }




  setThemeMode(bool? isDarkTheme) {
    print("WRITE MODE---$isDarkTheme");
    globalStorage.write(Preferences.THEME_MODE, isDarkTheme.toString());
  }

  bool? getThemeMode() {
    var value = globalStorage.read(Preferences.THEME_MODE);
    print("READ MODE---$value");
    return value == "true";
  }

  String getPassword() {
    return container.read(Preferences.PASSWORD) ?? "";
  }

  setPassword(var value)  {
    container.write(Preferences.PASSWORD, value);
  }

  setLoginReminder(bool value){
    globalStorage.write(Preferences.LOGINREMINDER, value);
  }

  bool? getLoginReminder(){
    return globalStorage.read(Preferences.LOGINREMINDER);
  }

  setOnBoarding(bool value){
    globalStorage.write(Preferences.ONBOARDING, value);
  }

  bool? getOnBoarding(){
    return globalStorage.read(Preferences.ONBOARDING) ?? false;
  }

  setUserData(LoginResponse data){
    container.write(Preferences.USERDATA, data.toJson());
  }

  LoginResponse? getUserData() {
    var userMap=container.read(Preferences.USERDATA);
    if(userMap!=null){
      return LoginResponse.fromJson(userMap);
    }
    return LoginResponse.empty();
  }

  setStoreDetails(StoreFront data){
    globalStorage.write(Preferences.STOREDATA, data.toJson());
  }
  StoreFront? getStoreData() {
    var storeMap=globalStorage.read(Preferences.STOREDATA) ;
    // return storeMap;
    if (storeMap != null) {
      return StoreFront.fromJson(storeMap );
    }
    return null;
  }

  bool? getSocialLoginStatus(){
    return container.read(Preferences.IS_SOCIAL_LOGIN);
  }

  setSocialLoginStatus(bool isSocialLogin){
    container.write(Preferences.IS_SOCIAL_LOGIN, isSocialLogin);
  }

  bool? getMultipleProfileStatus(){
    return container.read(Preferences.MULTIPLE_PROFILE_ENABLE);
  }

  setMultipleProfileStatus(bool status){
    container.write(Preferences.MULTIPLE_PROFILE_ENABLE, status);
  }

  String getGuestId() {
    return container.read(Preferences.GUEST_ID) ?? "";
  }

  setGuestId(var value)  {
    container.write(Preferences.GUEST_ID, value);
  }

}



