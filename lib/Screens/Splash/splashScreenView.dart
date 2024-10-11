import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/StoreSelectionModels/storeFronts.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/imagesConstant.dart';
import '../../Helper/loader.dart';
import '../../Helper/storageHelper.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  bool isLoading = false;

  @override
  void initState() {
    print(
        "FIREBASE TOKEN -----------> ${storageController.getFirebaseToken()}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildUI(context);
  }

  Widget buildUI(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context,
          (StorageController().getOnBoarding() ?? false)
              ? (StorageController().getLoginStatus() ?? false)
                  ? ((StorageController().getStoreData() ??
                                  StoreFront('', '', '', ''))
                              .url !=
                          '')
                      ? bottomNavigation
                      : storeSelection
                  : ((StorageController().getLoginReminder() ?? false))
                      ? ((StorageController().getStoreData() ??
                                      StoreFront('', '', '', ''))
                                  .url !=
                              '')
                          ? bottomNavigation
                          : storeSelection
                      : login
              : onBoarding,
          (route) => false);
    });
    return Container(
      height: AppSizes.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.blue,
              AppColors.black,
              AppColors.blue,
              AppColors.black,
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            // stops: [0.0, 1.0],
            tileMode: TileMode.repeated),
      ),
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/Images/splash.png"),
      //     fit: BoxFit.fill,
      //   ),
      //   // color: AppColors.blue
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: AppSizes.height * 0.3),
            Image.asset(
                height: 50, width: AppSizes.width * 0.4, AppImages.logo),
            const SizedBox(height: AppSizes.size45),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.1),
              child: Text(
                GenericMethods.getStringValue(context, AppStringConstant.intro),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
            ),
            // Positioned(
            //     bottom: AppSizes.height * 0.01,
            //     right: 0,
            //     left: 0,
            //     child: Image.asset(
            //         // height: 30,
            //         // width: AppSizes.width/ 3.2,
            //         AppImages.splashBottomText)),
            Visibility(visible: isLoading, child: const Loader()),
            SizedBox(
              height: AppSizes.height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
