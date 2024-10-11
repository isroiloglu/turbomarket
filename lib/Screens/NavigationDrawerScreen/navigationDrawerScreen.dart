import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/AppBar/commonAppBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/commonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/dialogHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/StoreSelectionModels/storeFronts.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/NavigationDrawerScreen/widgets/bottomLayout.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/NavigationDrawerScreen/widgets/itemLayout.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/NavigationDrawerScreen/widgets/topLayout.dart';

import '../../Constants/appConstants.dart';
import '../../Constants/appStringConstants.dart';
import '../../Constants/imagesConstant.dart';
import '../../Constants/routeConstant.dart';
import '../../Helper/genericMethods.dart';
import '../../Models/NavigationDrawerModel/drawerMainttem.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerScreen> createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  List<DrawerMainItem> drawerList = [];

  @override
  Widget build(BuildContext context) {
    drawerList = GenericMethods.getNavigationDrawerData(context);
    return Scaffold(
      backgroundColor: MobikulTheme.lightGreyTest,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarSize),
        child: commonAppBar(
            context,
            true,
            GenericMethods.getStringValue(context, AppStringConstant.profile),
            true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: AppSizes.extraPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppSizes.size30,
                    ),
                    // topLayout(context),
                    itemLayout(context, drawerList),
                    bottomLayout(context),
                  ],
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if ((storageController.getLoginStatus()) ?? false) {
                  DialogHelper.confirmationDialog(
                      GenericMethods.getStringValue(
                          context, AppStringConstant.logoutMessage),
                      context, onConfirm: () {
                    StoreFront? storeData = storageController.getStoreData();
                    String language = storageController.getCurrentLanguage();
                    String currency = storageController.getCurrentCurrency();
                    storageController.logoutUser();
                    storageController.setStoreDetails(
                        storeData ?? StoreFront('', '', '', ''));
                    storageController.setCurrentLanguage(language);
                    storageController.setCurrentCurrency(currency);
                    Navigator.pushNamedAndRemoveUntil(
                        context, bottomNavigation, (route) => false);
                  }, onCancel: () {});
                } else {
                  Navigator.popAndPushNamed(
                    context,
                    login,
                  );
                }
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                    horizontal: AppSizes.extraPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.red),
                padding:
                    const EdgeInsets.symmetric(vertical: AppSizes.extraPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppImages.logoutIcon,
                      width: 24,
                      height: 24,
                      color: AppColors.white,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: AppSizes.normalPadding),
                      child: Text(
                        GenericMethods.getStringValue(
                            context,
                            ((storageController.getLoginStatus()) ?? false)
                                ? AppStringConstant.logOut
                                : AppStringConstant.login),
                        style: const TextStyle(color: AppColors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
