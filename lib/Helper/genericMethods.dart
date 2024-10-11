import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';

import '../Constants/appStringConstants.dart';
import '../Constants/imagesConstant.dart';
import '../Models/NavigationDrawerModel/childItems.dart';
import '../Models/NavigationDrawerModel/drawerMainttem.dart';
import 'alertMessage.dart';
import 'appLocalization.dart';

class GenericMethods {
  static String getStringValue(BuildContext context, String key) {
    return AppLocalizations.of(context)?.translate(key) ?? key;
  }

  static showAlertMessages(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AlertMessage.showSuccess(message, context);
    });
  }

  static showErrorAlertMessages(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AlertMessage.showError(message, context);
    });
  }

  static getColor(String color) {
    if (color != null && color.isNotEmpty) {
      String removeHex = color.replaceFirst("#", '').toString();
      String newColor = "0xFF$removeHex";
      int colorValue = int.parse(newColor);
      return colorValue;
    } else {
      return 0xFFF5F5DC;
    }
  }

  static Future<bool> connectedToNetwork() async {
    var result = await Connectivity().checkConnectivity();
    print('RESULT----->${result}');
    if (result == ConnectivityResult.mobile) {
      print("Internet connection is from Mobile data");
      return true;
    } else if (result == ConnectivityResult.wifi) {
      print("internet connection is from wifi");
      return true;
    } else if (result == ConnectivityResult.ethernet) {
      print("internet connection is from wired cable");
      return true;
    } else if (result == ConnectivityResult.bluetooth) {
      print("internet connection is from bluethooth threatening");
      return true;
    } else {
      print("No internet connection");
      return false;
    }
  }

  static void hideSoftKeyBoard() {
    SystemChannels.textInput.invokeMethod("TextInput.hide");
  }

  static List<DrawerMainItem> getNavigationDrawerData(BuildContext context) {
    List<DrawerMainItem> drawerList = [];

    // for main menu
    ChildItems childItems1 = ChildItems(
        "account",
        GenericMethods.getStringValue(context, AppStringConstant.myAccount),
        AppImages.myAccountIcon);
    ChildItems childItems2 = ChildItems(
        "order",
        GenericMethods.getStringValue(context, AppStringConstant.myOrders),
        AppImages.myOrdersIcon);
    ChildItems childItems3 = ChildItems(
        "points",
        GenericMethods.getStringValue(context, AppStringConstant.myPoints),
        AppImages.myPointsIcon);
    ChildItems childItems4 = ChildItems(
        "favorite",
        GenericMethods.getStringValue(context, AppStringConstant.myFavorite),
        AppImages.myFavoriteIcon);

    List<ChildItems> childItem1 = [
      childItems1,
      childItems2,
      childItems3,
      childItems4
    ];
    DrawerMainItem drawerMainItem1 = DrawerMainItem(
        "key_points",
        GenericMethods.getStringValue(context, AppStringConstant.keyPoints),
        childItem1);

    // for preferences menu
    List<ChildItems> preferencesList = [];
    if (GlobalData.homeScreenModels?.activeCurrencyList != null &&
        (GlobalData.homeScreenModels?.activeCurrencyList ?? []).isNotEmpty) {
      ChildItems location = ChildItems(
          "currency",
          "${GenericMethods.getStringValue(context, AppStringConstant.currency)} ${"-"}${storageController.getCurrentCurrency()}",
          AppImages.currencyIcon);
      preferencesList.add(location);
    }

    if (GlobalData.homeScreenModels?.activeLanguageList != null &&
        (GlobalData.homeScreenModels?.activeLanguageList ?? []).isNotEmpty) {
      ChildItems language = ChildItems(
          "language",
          "${GenericMethods.getStringValue(context, AppStringConstant.language)} ${"-"}${GlobalData.homeScreenModels?.activeLanguageList?.firstWhere((element) => element.langCode == storageController.getCurrentLanguage()).name ?? ''}",
          AppImages.languageIcon);
      preferencesList.add(language);
    }

    DrawerMainItem preferences = DrawerMainItem(
        "preference",
        GenericMethods.getStringValue(context, AppStringConstant.preference),
        preferencesList);

    // for CMS menu
    List<ChildItems> cmsPagesList = [];
    if (GlobalData.homeScreenModels != null &&
        GlobalData.homeScreenModels!.pageList != null &&
        (GlobalData.homeScreenModels?.pageList ?? []).isNotEmpty) {
      GlobalData.homeScreenModels!.pageList!.forEach((element) {
        ChildItems pageItem =
            ChildItems("cms", element!.pageName!, "", id: element!.pageId!);
        cmsPagesList.add(pageItem);
      });
    }
    drawerList.add(drawerMainItem1);
    if (preferencesList.isNotEmpty) {
      drawerList.add(preferences);
    }
    if (cmsPagesList.isNotEmpty) {
      DrawerMainItem pageList = DrawerMainItem(
          "others",
          GenericMethods.getStringValue(context, AppStringConstant.others),
          cmsPagesList);
      drawerList.add(pageList);
    }

    return drawerList;
  }
}
