import 'package:flutter/material.dart';

class ApiConstant {
  static const String authToken =
      "Bearer aGFzYW5iZWsuZWxtdXJvZG92QGdtYWlsLmNvbTpOcDMySzFBbm5uMzIxOFM4UzM4MFQwUmM3VDdtVDE2Nw==";
  static const String baseUrl = 'https://turbomarket.uz'; //LIVE SERVER URL
  // static const String baseUrl = 'https://all4u.market'; //OLD LIVE SERVER URL
  // static const String baseUrl = 'https://test.all4u.market/'; //DEMO SERVER URL

  static const String demoEmail = "demo@webkul.com";
  static const String demoPassword = "Demo123";
}

class AppConstant {
  static const String appDocPath = "";

  // static String defaultLanguage = 'ru';
  static String defaultCurrency = 'USD';
  static const List<String> supportedLanguages = ['ru', 'en', 'uz'];
  static const String country = "country";
  static const String page = "page";
  static const String product = "product";
  static const String category = "category";
  static const String generateOtp = "generate_otp";
  static const String verifyOtp = "verify_otp";

  //======Method Channel Name=====//
  static const channelName = "com.webkul.cscart_mobikul/channel";
  static const String customerNumber = "+99871 207 71 10";
  static const String customerEmail = "info@all4u.market";
}

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double size25 = 25;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const double iconButtonBorderRadius = 24;
  static const double itemHeight = 45;
  static double height =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  static double width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const appBarSize = 56.0;
  static const appBarSizeCustom = 89.0;
  static const appBarExpandedSize = 180.0;
  static const double normalPadding = 8.0;
  static const double mediumPadding = 12.0;
  static const double extraPadding = 16.0;
  static const double maximumPadding = 24.0;
  static const double buttonHeight = 40;
  static const double size50 = 50;
  static const double size55 = 55;
  static const double size16 = 16;
  static const double size26 = 26;
  static const double size35 = 35;
  static const double size32 = 32;
  static const double size30 = 30;
  static const double size40 = 40;
  static const double size45 = 45;
  static const double size20 = 20;
  static const double size150 = 150;
  static const double size100 = 100;
  static const double size110 = 110;
  static const double size73 = 73;
  static const double iconSize = 24;
  static const double size2 = 2;
  static const double size10 = 10;
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const lightRed = Color(0xFFF65F53);
  static const textBlue = Color(0xFF1A4391);
  static const black = Color(0xFF000000);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF615959);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const transparent1 = Color(0xFFFFFF);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
  static const yellow = Color(0xFFEA9301);
  static const blue = Color(0xFF2460C5);
  static const lightBlue = Color(0xCFD9D0F6);
  static const creditGreen = Color(0xFF0EB177);
  static const debitRed = Color(0xFFFF0000);
  static const productImage = Color(0xFFE8E8E8);
  static const productName = Color(0xFF808080);
  static const productDiscount = Color(0xFFFF8A00);
}
