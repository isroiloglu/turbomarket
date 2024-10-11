import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/categories.dart';

import '../../../Constants/arguments_map.dart';

Widget categoryListView(BuildContext context, List<Categories> categoryList,
    {bool isShowImage = true}) {
  return Expanded(
    child: ListView.separated(
      itemCount: categoryList.length,
      shrinkWrap: false,
      itemBuilder: (context, index) {
        return categoryTile(context, categoryList[index].category ?? '',
            categoryList[index].images ?? '', () {
          if (categoryList[index].subcategoryList?.isNotEmpty ?? false) {
            Navigator.pushNamed(context, subCategory,
                arguments: subCategoryDataMap(
                    categoryList[index].categoryId ?? '',
                    categoryList[index].category ?? ''));
          } else {
            Navigator.pushNamed(context, catalogPage,
                arguments: getCatalogMap(categoryList[index].categoryId ?? '',
                    "", categoryList[index].category ?? '', false));
          }
        }, isShowImage);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    ),
  );
}

Widget categoryTile(BuildContext context, String title, String url,
    Function() callback, bool isShowImage) {
  return ListTile(
    // visualDensity: VisualDensity(horizontal: -4.0,vertical: -2.0),
    contentPadding: EdgeInsets.zero,
    horizontalTitleGap: 16,
    dense: true,
    leading: (isShowImage)
        ? ImageView(
            url: url,
            height: AppSizes.iconSize,
            width: AppSizes.iconSize,
          )
        : const SizedBox(
            width: 0,
          ),
    minLeadingWidth: (isShowImage) ? null : 0,
    onTap: callback,
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios_outlined,
      size: 18.0,
    ),
  );
}
