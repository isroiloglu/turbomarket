import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/NavigationDrawerModel/drawerMainttem.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Constants/arguments_map.dart';
import '../../../Helper/dialogHelper.dart';
import '../../PreferencesScreen/currencyBottomsheet.dart';
import '../../PreferencesScreen/languageBottomsheet.dart';

Widget itemLayout(BuildContext context, List<DrawerMainItem> drawerList) {
  return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: drawerList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   drawerList[index].name,
            //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //       color: AppColors.lightGray, fontWeight: FontWeight.w600),
            // ),
            // const SizedBox(
            //   height: AppSizes.sidePadding,
            // ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: drawerList[index].childItems.length,
                itemBuilder: (BuildContext context, int childIndex) {
                  log('TITLE IS ${drawerList[index].childItems[childIndex].name}');
                  return Column(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if (drawerList[index].type == "preference") {
                            if (drawerList[index]
                                    .childItems[childIndex]
                                    .childType ==
                                "currency") {
                              showCurrencyBottomSheet(context);
                            } else if (drawerList[index]
                                    .childItems[childIndex]
                                    .childType ==
                                "language") {
                              showLanguage(context);
                            }
                          } else if (drawerList[index].type == "others") {
                            // CMS pages click events
                            Navigator.pushNamed(context, cmsPage,
                                arguments: getCmsMap(
                                  drawerList[index]
                                          .childItems[childIndex]
                                          ?.id ??
                                      "",
                                  drawerList[index]
                                          .childItems[childIndex]
                                          ?.name ??
                                      "",
                                ));
                          } else if (drawerList[index].type == "key_points") {
                            switch (drawerList[index]
                                .childItems[childIndex]
                                .childType) {
                              case "order":
                                if ((storageController.getLoginStatus()) ??
                                    false) {
                                  Navigator.pushNamed(context, orderList);
                                } else {
                                  DialogHelper.confirmationDialog(
                                      GenericMethods.getStringValue(context,
                                          AppStringConstant.signInToContinue),
                                      context, onConfirm: () {
                                    Navigator.pushNamed(context, login,
                                        arguments: false);
                                  }, onCancel: () {
                                    Navigator.pop(context);
                                  });
                                }
                                break;

                              case "points":
                                if ((storageController.getLoginStatus()) ??
                                    false) {
                                  Navigator.pushNamed(context, myPoints);
                                } else {
                                  DialogHelper.confirmationDialog(
                                      GenericMethods.getStringValue(context,
                                          AppStringConstant.signInToContinue),
                                      context, onConfirm: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, login,
                                        arguments: false);
                                  }, onCancel: () {
                                    Navigator.pop(context);
                                  });
                                }
                                break;

                              case "favorite":
                                Navigator.pushNamed(context, wishlist);
                                break;

                              case "account":
                                if ((storageController.getLoginStatus()) ??
                                    false) {
                                  Navigator.pushNamed(
                                      context, accountInformation);
                                } else {
                                  DialogHelper.confirmationDialog(
                                      GenericMethods.getStringValue(context,
                                          AppStringConstant.signInToContinue),
                                      context, onConfirm: () {
                                    Navigator.pushNamed(context, login,
                                        arguments: false);
                                  }, onCancel: () {
                                    Navigator.pop(context);
                                  });
                                }
                                break;
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: AppSizes.normalPadding,
                              bottom: AppSizes.normalPadding),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Visibility(
                                    visible: drawerList[index]
                                        .childItems[childIndex]
                                        .images
                                        .isNotEmpty,
                                    child: Image.asset(
                                      drawerList[index]
                                          .childItems[childIndex]
                                          .images,
                                      width: 24,
                                      height: 24,
                                      color: const Color(0xff101010),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: (drawerList[index]
                                                .childItems[childIndex]
                                                .images
                                                .isNotEmpty)
                                            ? AppSizes.extraPadding
                                            : 0.0),
                                    child: Text(
                                      drawerList[index]
                                          .childItems[childIndex]
                                          .name,
                                      style: const TextStyle(
                                        fontFamily: 'SF-Pro-Display',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    right: AppSizes.extraPadding),
                                child: Icon(Icons.chevron_right),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  );
                })
          ],
        );
      });
}
