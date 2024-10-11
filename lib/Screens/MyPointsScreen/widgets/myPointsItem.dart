import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/MyPointsModel/pointsData.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Constants/routeConstant.dart';
import '../../../Helper/genericMethods.dart';

Widget myPointsItem({PointsData? orderItems, required BuildContext context}){
  return Padding(
    padding: const EdgeInsets.only(top: AppSizes.normalPadding,bottom:AppSizes.normalPadding ),
    child: Container(
      padding: const EdgeInsets.all(AppSizes.sidePadding),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            GenericMethods.getStringValue(
                context,(orderItems?.amount??"").contains("-")?AppStringConstant.pointsDebited: AppStringConstant.pointsCredit),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600,color:(orderItems?.amount??"").contains("-")?AppColors.debitRed:AppColors.creditGreen) ),

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
                const Spacer(),
                Text(
                  (orderItems?.timestamp??""),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
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
                      context, AppStringConstant.points),
                  style: Theme.of(context).textTheme.labelSmall,
                ),

                Text(
                  ":",
                  style: Theme.of(context).textTheme.labelSmall,
                ), const SizedBox(width: 5,),
                const Spacer(),
                Text(
                  "${(orderItems?.amount??"").contains("-")? '': "+"}${orderItems?.amount??" "}",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: (orderItems?.amount??"").contains("-")?AppColors.debitRed:AppColors.creditGreen),
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
                      context, AppStringConstant.reason),
                  style: Theme.of(context).textTheme.labelSmall,
                ),

                Text(
                  ":",
                  style: Theme.of(context).textTheme.labelSmall,
                ), const SizedBox(width: 5,),
                const Spacer(),
                Flexible(

                  child: Text(
                    (orderItems?.reason??""),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.right,
                ),)
              ],
            ),
          ),

          Visibility(
            visible: orderItems?.orderId!=null && orderItems?.orderId!="",
            child: Padding(
              padding: const EdgeInsets.only(top: AppSizes.normalPadding),
              child: Row(
                children: [
                  Text(
                    GenericMethods.getStringValue(
                        context, AppStringConstant.orderId),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),

                  Text(
                    ":",
                    style: Theme.of(context).textTheme.labelSmall,
                  ), const SizedBox(width: 5,),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, orderDetail,arguments:orderItems?.orderId??"");
                    },
                    child: Text(
                      (orderItems?.orderId??""),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: MobikulTheme.clientPrimaryColor,decoration: TextDecoration.underline,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}