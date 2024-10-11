import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PromotionsModel/promotions.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/arguments_map.dart';
import '../../../Constants/routeConstant.dart';
import '../../../Helper/imageView.dart';

Widget promotionItem(BuildContext context, Promotions? promotions){
  return   GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, countryProduct,
      arguments:getCatalogMap(promotions?.promotionId ?? '', "", promotions?.name ?? '', true, fromBanner: true));

    },
    child: Padding(
      padding: const EdgeInsets.all(AppSizes.size10),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.07)),
              borderRadius:
              const BorderRadius.all(Radius.circular(AppSizes.normalPadding/2))
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.normalPadding/2),
            child: ImageView(
              url: promotions?.image,
              width: AppSizes.width,
              height: AppSizes.width/ 2.5,
              fit: BoxFit.fill,
              isBanner: true,
            ),
          )
      ),
    ),
  );
}