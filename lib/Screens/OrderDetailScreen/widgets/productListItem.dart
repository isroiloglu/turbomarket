import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OrderDetailModel/order_product.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Helper/genericMethods.dart';

Widget productListItem(
    {OrderProduct? orderItems, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(
        top: AppSizes.normalPadding, bottom: AppSizes.normalPadding),
    child: GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          ImageView(
            url: orderItems?.imagePath,
            height: AppSizes.size100,
            width: AppSizes.size100,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderItems?.product ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.normalPadding),
                  child: Row(
                    children: [
                      SizedBox(
                        width: AppSizes.size100,
                        child: Text(
                          GenericMethods.getStringValue(
                              context, AppStringConstant.price),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        (orderItems?.formatPrice ?? ""),
                        style:  Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.linePadding),
                  child: Row(
                    children: [
                      SizedBox(
                        width: AppSizes.size100,
                        child: Text(
                          GenericMethods.getStringValue(
                              context, AppStringConstant.qty),
                          style:Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        (orderItems?.amount.toString() ?? ""),
                        style:  Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.linePadding),
                  child: Row(
                    children: [
                      SizedBox(
                        width: AppSizes.size100,
                        child: Text(
                          GenericMethods.getStringValue(
                              context, AppStringConstant.totalPrice),
                          style:Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          (orderItems?.subtotal ?? ""),
                          style:  Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
