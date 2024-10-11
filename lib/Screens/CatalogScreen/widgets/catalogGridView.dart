import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';

import '../../../Constants/appConstants.dart';
import '../../../Models/HomePageModels/product_item.dart';
import '../../HomeScreen/Widgets/homeProductCart.dart';
import 'catalogItemCard.dart';

Widget catalogGridView(BuildContext context, List<ProductItem>? data,
    bool scrollable, var scrollController,
    {var from}) {
  int getListLength() {
    if (data == null) {
      return 0;
    } else {
      log('\nTOTAL IS ${data?.length}\n');
      log('\n EVEN IS ${data?.length.isEven}\n');

      if (from != "catalog") {
        return data.length.isEven ? data.length : data.length + 1;
      } else {
        return data.length;
      }
    }
  }

  return GridView.builder(
    // shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 12,
        // childAspectRatio: 0.61,
        mainAxisExtent: (AppSizes.width / 2) -
            (AppSizes.extraPadding + AppSizes.normalPadding) +
            185),
    itemCount: getListLength(),
    controller: scrollController,
    itemBuilder: (BuildContext context, int index) {
      return HomeProductCart(
        data?[index],
      );
    },
  );
}
