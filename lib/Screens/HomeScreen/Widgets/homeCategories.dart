import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/BottomNavigation/bottomNavigationScreen.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/categories.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/countries.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/arguments_map.dart';
import '../../../Helper/imageView.dart';

Widget homeCategories(
    BuildContext context, String title, List<Categories> categories) {
  return SizedBox(
    height: AppSizes.height * 0.15,
    width: AppSizes.width.toDouble(),
    child: ListView.builder(
        shrinkWrap: true,
        // physics: const BouncingScrollPhysics(),
        itemCount: categories.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0
              ? Padding(
                  padding: const EdgeInsets.only(
                      left: AppSizes.extraPadding,
                      right: AppSizes.extraPadding),
                  child: GestureDetector(
                    onTap: () {
                      GlobalData.selectedIndex = 1;
                      Navigator.pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const BottomNavigationScreen()),
                        ModalRoute.withName('/'),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border:
                                Border.all(color: AppColors.white, width: 1),
                            color: const Color(0xff0C1CA5),
                          ),
                          child: Image.asset(
                            'assets/Images/catalog.png',
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 60,
                          child: Text(
                            GenericMethods.getStringValue(
                                    context, AppStringConstant.catalog) ??
                                '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: AppSizes.extraPadding),
                  child: GestureDetector(
                    onTap: () {
                      if (categories[index - 1].subcategoryList?.isNotEmpty ??
                          false) {
                        Navigator.pushNamed(context, subCategory,
                            arguments: subCategoryDataMap(
                                categories[index - 1].categoryId ?? '',
                                categories[index - 1].category ?? ''));
                      } else {
                        Navigator.pushNamed(context, catalogPage,
                            arguments: getCatalogMap(
                                categories[index - 1].categoryId ?? '',
                                "",
                                categories[index - 1].category ?? '',
                                false));
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border:
                                Border.all(color: AppColors.white, width: 1),
                            color: MobikulTheme.whiteGrey,
                          ),
                          child: Image.network(
                            categories[index - 1].images ?? '',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 60,
                          child: Text(
                            categories[index - 1].category ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        }),
  );
}
