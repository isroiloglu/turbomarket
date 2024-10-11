import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/imagesConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';

import '../../../Constants/appConstants.dart';

Widget bottomLayout(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Divider(
      //   thickness: 1,
      //   color: Theme.of(context).dividerTheme.color,
      // ),
      Text(
          GenericMethods.getStringValue(
              context, AppStringConstant.customerServices),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w500)),
      Text((GlobalData.homeScreenModels?.contactDetails?.phone)??GenericMethods.getStringValue(context, AppConstant.customerNumber),
          style: Theme.of(context).textTheme.bodySmall),
      Text((GlobalData.homeScreenModels?.contactDetails?.email)??GenericMethods.getStringValue(context, AppConstant.customerEmail),
          style: Theme.of(context).textTheme.bodySmall),
      Divider(
        color: Theme.of(context).dividerTheme.color,
      ),

    ],
  );
}
