import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/BottomNavigation/badgeIcon.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/imagesConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/dialogHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';

import '../../Helper/globalData.dart';
import '../../Helper/storageHelper.dart';
import '../badgeIconUpdate.dart';

Widget commonAppBar(
    BuildContext context, bool? showTitle, String? title, bool? showShopLogo,
    {bool showSearch = true,
    bool isFromProduct = false,
    bool isFromAccount = false,
    Function(String)? callback,
    bool isLoading = false}) {
  return Container(
    alignment: Alignment.bottomCenter,
    color: MobikulTheme.lightGreyTest,
    height: double.infinity,
    margin: const EdgeInsets.only(
        left: AppSizes.extraPadding,
        right: AppSizes.extraPadding,
        bottom: AppSizes.normalPadding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  GlobalData.selectedIndex = 0;
                  Navigator.pushNamedAndRemoveUntil(
                      context, bottomNavigation, (route) => false);
                }

                // Navigator.pop(context);
              },
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(11),
                child: Image.asset(
                  'assets/Images/arrow-left.png',
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title ??
                  GenericMethods.getStringValue(
                      context, AppStringConstant.products),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.black,
                fontFamily: 'SF-Pro-Display',
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, cartPage);
              },
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(11),
                child: Image.asset(
                  'assets/Images/bag.png',
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, wishlist);
              },
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(11),
                child: Image.asset(
                  'assets/Images/heart.png',
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
