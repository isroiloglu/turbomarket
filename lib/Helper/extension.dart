import 'dart:ui';

import 'package:flutter/cupertino.dart';


Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}

// Future<bool> onWillPop(BuildContext context, DateTime? currentBackPressTime) {
//   DateTime now = DateTime.now();
//   if (currentBackPressTime == null ||
//       now.difference(currentBackPressTime) > Duration(seconds: 3)) {
//     currentBackPressTime = now;
//     AlertMessage.showWarring(AppLocalizations.of(context)!.translate(AppStrings.press_back_again_to_exit_app)!,context);
//     return Future.value(false);
//   }
//   return Future.value(true);
// }
