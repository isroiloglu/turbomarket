import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({Key? key, required this.onComplete}) : super(key: key);
  final Function(String code) onComplete;

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final defaultPinTheme = PinTheme(
    width: AppSizes.width * 0.1267,
    height: AppSizes.height * 0.054,
    textStyle: const TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 12,
        color: Color(0xff1A0700),
        fontWeight: FontWeight.w700),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color(0xffE2E2E2), width: 0.96),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: defaultPinTheme,
      length: 6,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: widget.onComplete,
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      cursor: Container(
        margin: const EdgeInsets.only(),
        width: 1,
        height: 24,
        color: AppColors.lightGray,
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.lightGray, width: 0.96),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.lightGray, width: 0.96),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
