import 'package:flutter/material.dart';

import '../Config/theme.dart';
import '../Constants/imagesConstant.dart';
import '../Helper/storageHelper.dart';
import 'BottomNavigation/badgeIcon.dart';
import 'BottomNavigation/bottomNavigationScreen.dart';

class BadgeIconUpdate extends StatefulWidget {
  const BadgeIconUpdate({Key? key}) : super(key: key);

  @override
  State<BadgeIconUpdate> createState() => _BadgeIconUpdateState();
}

class _BadgeIconUpdateState extends State<BadgeIconUpdate> {
  late int _badgeCount;

  @override
  void initState() {
    if (storageController.getBadgeCount().isNotEmpty &&
        storageController.getBadgeCount() != "null" &&
        storageController.getBadgeCount() != "0") {
      _badgeCount = int.parse(storageController.getBadgeCount());
    } else {
      _badgeCount = 0;
    }
    // if (storageController.getBadgeCount().isNotEmpty && storageController.getBadgeCount()!="null" && storageController.getBadgeCount()!="0") {
    //   _badgeCount = int.parse(storageController.getBadgeCount());
    // } else {
    //   _badgeCount = 0;
    // }

    super.initState();
  }

  void _registerStreamListener() {
    TabbarController.countController.stream.listen((event) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _badgeCount = event;
        });
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    _registerStreamListener();
    return BadgeIcon(
      icon:
      Image.asset(
        AppImages.cartIcon,
        width: 30,
        height: 30,
        color: MobikulTheme.clientPrimaryColor,
      ),
      isFromProduct: true,
      badgeCount: _badgeCount,
    );
  }
}