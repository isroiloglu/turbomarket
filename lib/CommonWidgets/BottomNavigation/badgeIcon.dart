import 'package:flutter/material.dart';

import '../../Constants/appConstants.dart';

class BadgeIcon extends StatelessWidget {
  const BadgeIcon(
      {Key? key, this.icon,
        this.badgeCount = 0,
        this.showIfZero = false,
        this.badgeColor = Colors.red,
        this.isFromProduct = false,
        TextStyle? badgeTextStyle})
      : badgeTextStyle = badgeTextStyle ??
      const TextStyle(
        color: Colors.white,
        fontSize: 8,
      ), super(key: key);
  final Widget? icon;
  final int badgeCount;
  final bool showIfZero;
  final Color badgeColor;
  final TextStyle badgeTextStyle;
  final bool isFromProduct;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
      icon!,
      if (badgeCount > 0 || showIfZero) badge(badgeCount),
    ]);
  }

  Widget badge(int count) => Positioned(
    right: isFromProduct? -1: AppSizes.width / 20,
    top: 0,
    // bottom: 20,
    // left: 10,
    child: Container(
      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(8.5),
      ),
      constraints: const BoxConstraints(
        minWidth: 15,
        minHeight: 15,
      ),
      child: Center(
        child: Text(
          (count > 99) ? "99+" :
          count.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
