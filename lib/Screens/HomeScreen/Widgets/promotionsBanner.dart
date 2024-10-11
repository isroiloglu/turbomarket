import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/HomePageModels/homePromotions.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/arguments_map.dart';
import '../../../Helper/imageView.dart';

Widget promotionsBanner(BuildContext context, List<Promotions>? promotionList) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: AppSizes.width / 4,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: ((promotionList?.length ?? 0) > 1)
                ? (promotionList!.length + 1)
                : promotionList?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(right: AppSizes.extraPadding),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.07)),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(AppSizes.normalPadding / 2))),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppSizes.normalPadding / 2),
                    child: (index == promotionList!.length)
                        ? GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, promotions);
                            },
                            child: SizedBox(
                              width: AppSizes.width / 12 * 7,
                              height: AppSizes.width / 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      GenericMethods.getStringValue(
                                          context, AppStringConstant.viewAll),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: MobikulTheme
                                                  .clientPrimaryColor)),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: MobikulTheme.clientPrimaryColor,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, countryProduct,
                                  arguments: getCatalogMap(
                                      promotionList[index].promotionId ?? '',
                                      "",
                                      promotionList[index].name ?? '',
                                      true,
                                      fromBanner: true));
                            },
                            child: ImageView(
                              url: promotionList[index].image,
                              width: AppSizes.width / 12 * 7,
                              height: AppSizes.width / 4,
                              fit: BoxFit.fill,
                              isBanner: true,
                            ),
                          ),
                  ));
            }),
      ),
      const SizedBox(
        height: AppSizes.extraPadding * 2,
      ),
    ],
  );
}
