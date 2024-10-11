import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import '../../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../../CommonWidgets/BottomNavigation/bottomNavigationScreen.dart';
import '../../../Constants/imagesConstant.dart';
import '../../../Constants/routeConstant.dart';
import '../../../Helper/globalData.dart';
import '../../../Helper/storageHelper.dart';

class OrderSuccessScreen extends StatefulWidget {
  final String orderId;

  const OrderSuccessScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        GlobalData.selectedIndex = 0;
        Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const BottomNavigationScreen()),
          ModalRoute.withName('/'),
        );
        storageController.setBadgeCount("");
        TabbarController.countController.sink.add(int.parse("0"));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    GlobalData.selectedIndex = 0;
                    Navigator.pushNamedAndRemoveUntil(
                        context, bottomNavigation, (route) => false);
                  }
                },
                child: Image.asset(
                  AppImages.backIcon,
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
          leadingWidth: 0,
          title: Text(
            GenericMethods.getStringValue(
                    context, AppStringConstant.yourOrderCompleteMsg) ??
                "",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  GlobalData.selectedIndex = 0;
                  Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const BottomNavigationScreen()),
                    ModalRoute.withName('/'),
                  );
                  storageController.setBadgeCount("");
                  TabbarController.countController.sink.add(int.parse("0"));
                },
                icon: const Icon(Icons.close))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/Images/check-circle.png',
                  width: 60.0, height: 60.0),
              const SizedBox(
                height: AppSizes.normalPadding,
              ),
              Text(
                "${GenericMethods.getStringValue(context, AppStringConstant.order)} #${widget.orderId} ${GenericMethods.getStringValue(context, AppStringConstant.orderSuccessMsg)}",
                style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
                    color: AppTheme.cashbackPointColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.extraPadding,
              ),
              Text(
                GenericMethods.getStringValue(
                    context, AppStringConstant.orderFinalDetailedMsg),
                style: AppTheme.lightTheme.textTheme.labelMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
