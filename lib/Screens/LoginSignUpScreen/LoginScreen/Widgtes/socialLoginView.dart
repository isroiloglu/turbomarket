import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/loginScreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/loginScreenStates.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/socialLoginHandler.dart';

import '../../../../Constants/appConstants.dart';
import '../../../../Constants/imagesConstant.dart';
import '../../../../Helper/alertMessage.dart';
import '../../../../Helper/storageHelper.dart';
import '../../../../Models/LoginSignupModels/Requests/social_login_request.dart';
import '../../../OrderTrackerScreen/bloc/orderTrackingEvents.dart';
import '../bloc/loginScreenEvents.dart';

class SocialLoginView extends StatefulWidget {
  LoginScreenBloc loginScreenBloc;

  SocialLoginView(this.loginScreenBloc, {Key? key}) : super(key: key);

  @override
  State<SocialLoginView> createState() => _SocialLoginViewState();
}

class _SocialLoginViewState extends State<SocialLoginView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (Platform.isIOS)
          GestureDetector(
            onTap: () {
              onClickApple(context);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: MobikulTheme.whiteGrey),
              child: Image.asset(
                AppImages.appleIcon,
                height: AppSizes.size25,
                width: AppSizes.size25,
              ),
            ),
          ),
        SizedBox(width: AppSizes.size30),

        GestureDetector(
          onTap: () {
            onClickFacebook(context);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MobikulTheme.whiteGrey),
            child: Image.asset(
              AppImages.facebookIcon,
              height: AppSizes.size25,
              width: AppSizes.size25,
            ),
          ),
        ),
        SizedBox(width: AppSizes.size30),
        GestureDetector(
          onTap: () {
            onClickGoogle(context);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MobikulTheme.whiteGrey),
            child: Image.asset(
              AppImages.googleIcon,
              height: AppSizes.size25,
              width: AppSizes.size25,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> onClickFacebook(BuildContext context) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      socialLoginHandler.signOut();
      var result = await socialLoginHandler.handleFacebookSignIn(context);
      var profile = await socialLoginHandler.facebookLogin.getUserProfile();
      if (result?.status == FacebookLoginStatus.success) {
        var request = SocialLoginRequest(
          companyId: "",
          firstName: profile?.firstName,
          lastName: profile?.lastName,
          email: await socialLoginHandler.facebookLogin.getUserEmail(),
          guestId: "",
          chatToken: storageController.getFirebaseToken(),
          languageCode: storageController.getCurrentLanguage(),
          currencyCode: storageController.getCurrentCurrency(),
        );
        widget.loginScreenBloc?.add(SocialLoginEvent(request));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showWarning("SignIn Error", context);
        });
      }
      widget.loginScreenBloc?.emit(LoginScreenEmptyState());
    } else {}
  }

  Future<void> onClickGoogle(BuildContext context) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      socialLoginHandler.signOut();
      var result = await socialLoginHandler.handleGoogleSignIn(context);
      if (result != null && (result.email).isNotEmpty) {
        var request = SocialLoginRequest(
          companyId: "",
          firstName: result.displayName,
          lastName: "",
          email: result.email,
          guestId: "",
          chatToken: storageController.getFirebaseToken(),
          languageCode: storageController.getCurrentLanguage(),
          currencyCode: storageController.getCurrentCurrency(),
        );
        widget.loginScreenBloc?.add(SocialLoginEvent(request));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showWarning("SignIn Error", context);
        });
      }
      widget.loginScreenBloc?.emit(LoginScreenEmptyState());
    } else {}
  }

  Future<void> onClickApple(BuildContext context) async {
    dynamic connected = await GenericMethods.connectedToNetwork();
    if (connected == true) {
      socialLoginHandler.signOut();

      const platform = MethodChannel(AppConstant.channelName);
      var result = await platform.invokeMethod("appleSignin");
      print("appleSignin===> " +
          result["firstname"].toString() +
          "   " +
          result["lastname"].toString() +
          "   " +
          result["email"].toString());
      if (result != null) {
        var request = SocialLoginRequest(
          companyId: storageController.getCompanyId(),
          firstName: result["firstname"],
          lastName: result["lastname"],
          email: result["email"],
          guestId: "",
          languageCode: storageController.getCurrentLanguage(),
          currencyCode: storageController.getCurrentCurrency(),
        );
        widget.loginScreenBloc?.add(SocialLoginEvent(request));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showWarning("SignIn Error", context);
        });
      }
    }
  }
}

Widget commonContainer(BuildContext context, Widget child,
    {Color? backgroundColor,
    Color? shadowColor,
    double? borderRadius,
    double? verticalPadding,
    double? horizontalPadding,
    double? verticalMargin,
    double? horizontalMargin,
    double? height,
    double? width,
    double? shadowBlurRadius}) {
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 0,
        horizontal: horizontalPadding ?? verticalPadding ?? 0),
    margin: EdgeInsets.symmetric(
        vertical: verticalMargin ?? 0,
        horizontal: horizontalMargin ?? verticalMargin ?? 0),
    height: height,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 8.0),
        ),
        border:
            Border.all(width: 1, color: AppColors.lightGray.withOpacity(0.2)),
        color: backgroundColor),
    child: child,
  );
}
