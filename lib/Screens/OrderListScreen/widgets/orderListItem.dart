import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OrderListModel/order.dart';

Widget orderListItem(
    {required Order orderItems, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(top: AppSizes.normalPadding,bottom:AppSizes.normalPadding ),
    child: GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, orderDetail,arguments:orderItems.orderId??"");

      },
      child: Container(
        padding: const EdgeInsets.all(AppSizes.sidePadding),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${GenericMethods.getStringValue(
                      context, AppStringConstant.order)} #${orderItems.orderId ?? ""}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSizes.normalPadding),
              child: Row(
                children: [
                  Text(
                    GenericMethods.getStringValue(
                        context, AppStringConstant.status),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),

                  Text(
                    ":",
                    style: Theme.of(context).textTheme.labelSmall,
                  ), const SizedBox(width: 5,),
                  Text(
                   (orderItems.status??"").toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSizes.normalPadding),
              child: Row(
                children: [
                  Text(
                    GenericMethods.getStringValue(
                        context, AppStringConstant.customer),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),

                  Text(
                    ":",
                    style: Theme.of(context).textTheme.labelSmall,
                  ), const SizedBox(width: 5,),
                  Text(
                    (orderItems.firstname??""),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSizes.normalPadding),
              child: Row(
                children: [
                  Text(
                    GenericMethods.getStringValue(
                        context, AppStringConstant.date),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),

                  Text(
                    ":",
                    style: Theme.of(context).textTheme.labelSmall,
                  ), const SizedBox(width: 5,),
                  Text(
                    (orderItems.timestamp??""),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSizes.normalPadding),
              child: Row(
                children: [
                  Text(
                    GenericMethods.getStringValue(
                        context, AppStringConstant.orderAmount),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),

                  Text(
                    ":",
                    style: Theme.of(context).textTheme.labelSmall,
                  ), const SizedBox(width: 5,),
                  Text(
                    (orderItems.total??""),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
