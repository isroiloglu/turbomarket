import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';

import '../../../Helper/genericMethods.dart';

Widget emptyWishlistView( BuildContext context) {
  return Center(
    child: Text(GenericMethods.getStringValue(context, AppStringConstant.noItemFound)
    ),
  );
}