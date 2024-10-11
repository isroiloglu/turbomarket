import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/Widgtes/otp_widget.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/Widgtes/socialLoginView.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/loginScreenBloc.dart';

import '../../../../CommonWidgets/AppBar/commonAppBar.dart';
import '../../../../Constants/appStringConstants.dart';
import '../../../../Constants/imagesConstant.dart';
import '../../../../Constants/routeConstant.dart';
import '../../../../CustomWidgets/CommonButton.dart';
import '../../../../Helper/genericMethods.dart';
import '../../../../Utils/validator.dart';

class OtpVerificationScreen extends StatefulWidget {
  Function(String) callback;
  VoidCallback backCallBack;
  String phoneNumber;
  VoidCallback reSendCallback;
  String otpExpireTime;

  OtpVerificationScreen(
      {required this.callback,
      required this.backCallBack,
      required this.phoneNumber,
      required this.reSendCallback,
      required this.otpExpireTime,
      Key? key})
      : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final CountdownController _controller = CountdownController(autoStart: true);
  bool showResentOption = false;
  String? otpCode;

  @override
  void dispose() {
    // implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: Row(
      //     // mainAxisSize: MainAxisSize.min,
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //           widget.backCallBack();
      //           print('object');
      //         },
      //         child: Image.asset(
      //           AppImages.backIcon,
      //           width: 25,
      //           height: 25,
      //         ),
      //       ),
      //       Text(
      //         GenericMethods.getStringValue(context, AppStringConstant.back)?? '',
      //         style: Theme.of(context)
      //             .textTheme
      //             .bodyMedium
      //             ?.copyWith(fontWeight: FontWeight.w600),
      //       )
      //     ],
      //   ),
      //   leadingWidth:  85,
      //
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.mediumPadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: AppSizes.maximumPadding + AppSizes.appBarSize,
                ),
                Text(
                  GenericMethods.getStringValue(
                      context,
                      GenericMethods.getStringValue(
                          context, AppStringConstant.login)!),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'SF-Pro-Display',
                  ),
                ),
                const SizedBox(
                  height: AppSizes.mediumPadding,
                ),
                Text(
                  GenericMethods.getStringValue(context,
                      '${GenericMethods.getStringValue(context, AppStringConstant.loginText2)} ${widget.phoneNumber!}'),
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'SF-Pro-Display',
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                    height: AppSizes.splashScreenTitleFontSize + 10.toDouble()),
                OtpWidget(onComplete: (String code) {
                  otpCode = code;
                }),
                const SizedBox(height: AppSizes.size16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 16,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                        const SizedBox(width: 8.0),
                        Countdown(
                          controller: _controller,
                          seconds: (int.parse(widget.otpExpireTime) * 60) - 1,
                          interval: const Duration(seconds: 1),
                          build: (_, double time) => Text(
                            "${(time ~/ 60)}:${(time % 60).toInt()}" ??
                                time.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 12,
                                    color: AppColors.black.withOpacity(0.5)),
                          ),
                          onFinished: () {
                            setState(() {
                              showResentOption = true;
                            });
                          },
                        ),
                      ],
                    ),
                    Visibility(
                      visible: showResentOption,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          widget.reSendCallback();
                          print('----------------------');
                          _controller.restart();
                        },
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.restart,
                              size: 16,
                              color: AppColors.black.withOpacity(0.5),
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              GenericMethods.getStringValue(
                                  context,
                                  GenericMethods.getStringValue(
                                      context, AppStringConstant.resendOtp)!),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 12,
                                      color: AppColors.black.withOpacity(0.5)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: AppSizes.size30,
                ),
                commonButton(context, () {
                  GenericMethods.hideSoftKeyBoard();
                  if (_formKey.currentState?.validate() == true) {
                    widget.callback(otpCode ?? '');
                  }
                },
                    GenericMethods.getStringValue(
                        context, AppStringConstant.continueLabel),
                    textColor: AppColors.white,
                    backgroundColor: MobikulTheme.clientPrimaryColorA,
                    borderRadius: 12,
                    height: AppSizes.height * 0.054),
                const SizedBox(
                  height: AppSizes.extraPadding * 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.normalPadding),
                      child: Text(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.or),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 16, color: AppColors.lightGray),
                      ),
                    ),
                    const Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.extraPadding * 2,
                ),
                SocialLoginView(LoginScreenBloc()!),
                const SizedBox(
                  height: AppSizes.maximumPadding,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.doNotHaveAnAccountYet),
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, signup);
                        },
                        child: Text(
                          " ${GenericMethods.getStringValue(context, AppStringConstant.signUpNow)}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CodeInput extends StatelessWidget {
  final bool autoFocus;
  final int? count;
  TextEditingController controller;

  CodeInput(
      {Key? key,
      required this.autoFocus,
      this.count = 0,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppSizes.width * 0.063,
          child: TextFormField(
            controller: controller,
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: (value) {
              print('-------------------$value>>>>>>>>');
              if ((value.length == 1) && (count != 5)) {
                FocusScope.of(context).nextFocus();
              } else if ((value.isEmpty) && (count != 0)) {
                FocusScope.of(context).previousFocus();
              }
            },
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return '';
              }
            },
            decoration: const InputDecoration(
              hintText: "*",
              hintStyle: TextStyle(color: Colors.grey),
              counterText: "",
            ),
          ),
        ),
      ],
    );
  }
}
