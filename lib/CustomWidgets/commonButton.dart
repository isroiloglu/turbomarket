import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';

import '../Constants/appConstants.dart';

Widget commonButton(
  BuildContext context,
  VoidCallback onPressed,
  String text, {
  double? width,
  double? height,
  Widget? widget,
  Color? textColor,
  Color? backgroundColor,
  Color? borderSideColor,
  double borderRadius = 4,
  FontWeight? fontWeight,
  double? elevation = 0.0,
  TextStyle? textStyle,
}) {
  return Container(
    width: (width != null) ? width : AppSizes.width,
    height: (height != null) ? height : AppSizes.height / 13,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          elevation: elevation,
          side: borderSideColor != null
              ? BorderSide(color: borderSideColor)
              : const BorderSide(color: AppColors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          minimumSize: Size((width != null) ? width : AppSizes.width,
              (height != null) ? height : AppSizes.height / 13),
          backgroundColor: backgroundColor ?? MobikulTheme.clientPrimaryColor),
      child: widget ??
          Text(
            text,
            style: textStyle == null
                ? Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: textColor, fontWeight: fontWeight)
                : textStyle,
            textAlign: TextAlign.center,
          ),
    ),
  );
}
