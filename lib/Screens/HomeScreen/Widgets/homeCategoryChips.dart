import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';

Widget homeCategoryChips(
    BuildContext context, Function() callback, String title, bool selected) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected
              ? MobikulTheme.clientPrimaryColor
              : const Color(0xffEBEBEB)),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? AppColors.white : AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
