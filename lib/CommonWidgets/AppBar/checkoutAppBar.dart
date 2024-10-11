import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/imagesConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';

import '../../Helper/globalData.dart';

Widget checkoutAppbar(BuildContext context, String? title,
    {bool showSearch = true}) {
  return Container(
    color: AppColors.white,
    padding: const EdgeInsets.fromLTRB(
        AppSizes.mediumPadding, AppSizes.size10, AppSizes.mediumPadding, 0),
    child: AppBar(
      elevation: 0,
      forceMaterialTransparency: true,
      leading: Row(
        // mainAxisSize: MainAxisSize.min,
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
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: MobikulTheme.lightGreyTest),
              child: Image.asset(
                AppImages.backIcon,
                height: 25,
                width: 25,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        title ?? "",
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      actions: [
        (showSearch)
            ? GestureDetector(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    GlobalData.selectedIndex = 0;
                    Navigator.pushNamedAndRemoveUntil(
                        context, bottomNavigation, (route) => false);
                  }
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MobikulTheme.lightGreyTest),
                    child: const Icon(Icons.close)))
            : Container(),
      ],
    ),
  );
}
