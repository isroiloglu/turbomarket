

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';

import '../../Constants/appConstants.dart';
import '../../CustomWidgets/CommonButton.dart';
import '../../Helper/genericMethods.dart';


Future<dynamic> bottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Wrap(
           children: [SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.only(left: 10,right: 10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   const SizedBox(height: AppSizes.iconButtonBorderRadius),
                   Text(
                     GenericMethods.getStringValue(context, AppStringConstant.checkoutAs),
                     style: Theme.of(context).textTheme.titleSmall,
                   ),
                   const SizedBox(height: AppSizes.sidePadding),

                   commonButton(context, () {
                     Navigator.of(context).pop();
                     Navigator.pushNamed(context, login, arguments: false);
                   },
                       GenericMethods.getStringValue(context, AppStringConstant.login).toUpperCase(),
                       textColor: AppColors.white,
                       fontWeight: FontWeight.w600,
                       height: AppSizes.width / 7),

                   const SizedBox(height: AppSizes.sidePadding),

                   // commonButton(context, () {
                   //   Navigator.of(context).pop();
                   //   Navigator.pushNamed(context, signup);
                   // },
                   //     GenericMethods.getStringValue(context, AppStringConstant.signUp).toUpperCase(),
                   //     textColor: AppColors.white,
                   //     fontWeight: FontWeight.w600,
                   //
                   //     height: AppSizes.width / 7),
                   //
                   // const SizedBox(height: AppSizes.sidePadding),

                   commonButton(context, () {
                     Navigator.of(context).pop();
                     Navigator.pushNamed(context, guestCheckoutAddress);
                   },
                       GenericMethods.getStringValue(context, AppStringConstant.checkoutAsGuest).toUpperCase(),
                       textColor: AppColors.white,
                       fontWeight: FontWeight.w600,

                       height: AppSizes.width / 7),



                  const  SizedBox(height: AppSizes.sidePadding),


                 ],
               ),
             ),
           )],

          );
        });
      });
}