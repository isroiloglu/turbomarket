import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/routeConstant.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/CommonButton.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/appLocalization.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/OnBoarding/Widget/slider.dart';

import '../../Constants/appConstants.dart';
import '../../Constants/appStringConstants.dart';
import '../../Models/onBoardingScreemModel.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  AppLocalizations? _localizations;
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  late PageController _controller;
  int initialPage = 0;

  void initState() {
    super.initState();
    StorageController().setOnBoarding(true);
    _controller = PageController(initialPage: initialPage);
  }

  @override
  void didChangeDependencies() {
    slides = getSlides(context);
    _localizations = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: (AppSizes.height * 0.85),
              padding: const EdgeInsets.only(bottom: AppSizes.extraPadding),
              child: PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return SliderForOnBoarding(
                      logo: slides[index].getLogo(),
                      heading: slides[index].getHeading(),
                      image: slides[index].getImage(),
                      description: slides[index].getDescription(),
                    );
                  }),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: AppSizes.extraPadding),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: MobikulTheme.whiteGrey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonButton(context, () {
                    if (currentIndex < slides.length - 1) {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    } else {
                      Navigator.pushNamedAndRemoveUntil(
                          context, login, (route) => false);
                    }
                  }, _localizations?.translate(AppStringConstant.next) ?? '',
                      backgroundColor: MobikulTheme.clientPrimaryColorA,
                      textStyle: const TextStyle(
                          fontFamily: 'SF-Pro-Display',
                          color: Colors.white,
                          fontSize: 14),
                      height: AppSizes.height * 0.054,
                      width: AppSizes.width * 0.54,
                      borderRadius: 10),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, login, (route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.skip ?? ''),
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'SF-Pro-Display',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
            // Spacer(),
            // Container(
            //   height: (AppSizes.height * 0.1),
            //   // color: AppColors.red,
            //   // padding: const EdgeInsets.all(AppSizes.extraPadding),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         child: Padding(
            //           padding: const EdgeInsets.all(AppSizes.extraPadding),
            //           child: Text(_localizations?.translate(AppStringConstant.skip) ?? '',style: Theme.of(context).textTheme.bodyMedium,),
            //         ),
            //         onTap: () {
            //           Navigator.pushNamedAndRemoveUntil(context, login, (route) => false);
            //         },
            //       ),
            //       Row(
            //         children: List.generate(
            //           slides.length,
            //               (index) => buildDot(index, context),
            //         ),
            //       ),
            //       GestureDetector(
            //         child: Padding(
            //           padding: const EdgeInsets.all(AppSizes.extraPadding),
            //           child: Text(_localizations?.translate(
            //             currentIndex == slides.length - 1
            //                 ? AppStringConstant.done
            //                 : AppStringConstant.next) ?? '',
            //               style: Theme.of(context).textTheme.bodyMedium),
            //         ),
            //         onTap: (){
            //           if(currentIndex < slides.length - 1) {
            //             _controller.nextPage(
            //                 duration: const Duration(milliseconds: 500),
            //                 curve: Curves.linear);
            //           } else {
            //             Navigator.pushNamedAndRemoveUntil(context, login, (route) => false);
            //           }
            //         },
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Padding buildDot(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.linePadding / 2),
      child: Container(
        height: 10,
        width: 10,
        margin: const EdgeInsets.only(top: AppSizes.linePadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.lightGray),
          color: currentIndex == index ? AppColors.darkGray : null,
        ),
      ),
    );
  }
}
