import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OrderDetailModel/order_details_model.dart';

import '../../../CommonWidgets/widgetSpace.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Helper/genericMethods.dart';

Widget mainWidget(BuildContext context, OrderDetailsModel? orderDetailModel,){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      widgetSpace(0, AppSizes.normalPadding),
      Text(
        orderDetailModel?.paymentMethod ?? "",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
      ),
      widgetSpace(0, AppSizes.size40),
      Text(
        "${GenericMethods.getStringValue(context, AppStringConstant.shippingMethod)}:",
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      widgetSpace(0, AppSizes.normalPadding),
      Text(
        (orderDetailModel?.shippingMethod?[0] ?? ""),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Visibility(
        visible: orderDetailModel?.storeData!=null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: (orderDetailModel?.storeData?.storeName??"").isNotEmpty,
              child: Text(
                (orderDetailModel?.storeData?.storeName ?? ""),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ,
              ),
            ),
            Visibility(
              visible: (orderDetailModel?.storeData?.storeAddress??"").isNotEmpty,
              child: Text(
                (orderDetailModel?.storeData?.storeAddress ?? ""),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Visibility(
              visible: (orderDetailModel?.storeData?.storeTime??"").isNotEmpty,
              child: Text(
                (orderDetailModel?.storeData?.storeTime ?? ""),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Visibility(
              visible: (orderDetailModel?.storeData?.storePhone??"").isNotEmpty,
              child: Text(
                (orderDetailModel?.storeData?.storePhone ?? ""),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      widgetSpace(0, AppSizes.sidePadding),
      Text(
        "${GenericMethods.getStringValue(context, AppStringConstant.amount)}:",
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      widgetSpace(0, AppSizes.normalPadding),
      Text(
        (orderDetailModel?.summary?.formatSubtotal ?? ""),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      widgetSpace(0, AppSizes.sidePadding),
      Text(
        "${GenericMethods.getStringValue(context, AppStringConstant.discountOnOrder)}:",
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      widgetSpace(0, AppSizes.normalPadding),
      Text(
        (orderDetailModel?.summary?.orderDiscount ?? ""),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      widgetSpace(0, AppSizes.size40),
      Row(
        children: [
          Text(
            "${GenericMethods.getStringValue(context, AppStringConstant.total)}:",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          widgetSpace(1, AppSizes.sidePadding),
          Text(orderDetailModel?.summary?.formatTotal ?? "",
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      widgetSpace(0, ((orderDetailModel?.rewardPoints?? 0)>0) ? AppSizes.normalPadding : 0),
      Visibility(
        visible: (orderDetailModel?.rewardPoints?? 0)>0,
        child: Row(
          children: [
            Text(
              "${GenericMethods.getStringValue(context, AppStringConstant.gotCashback)}:",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            widgetSpace(1, AppSizes.sidePadding),
            Text("${orderDetailModel?.rewardPoints??"0"} ${GenericMethods.getStringValue(context, ((orderDetailModel?.rewardPoints?? 0) > 1) ?AppStringConstant.points : AppStringConstant.point)}",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
      widgetSpace(0, AppSizes.normalPadding),
      Visibility(
        visible: int.parse((orderDetailModel?.pointsInUse ?? 0).toString()) > 0,
        child: Row(
          children: [
            Text(
              "${GenericMethods.getStringValue(context, AppStringConstant.pointsInUse)}:",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            widgetSpace(1, AppSizes.sidePadding),
            Text(orderDetailModel?.pointsInUse.toString()??"",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

      ),
      widgetSpace(0, AppSizes.normalPadding),
    ],
  );
}