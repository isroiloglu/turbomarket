import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CustomWidgets/login_textfield.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OtpModels/generateOtpRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/loginScreenStates.dart';

import '../../../CommonWidgets/BottomNavigation/bottomNavigationScreen.dart';
import '../../../CommonWidgets/IgnotePointer/ignorePointer.dart';
import '../../../Constants/appConstants.dart';
import '../../../Constants/appStringConstants.dart';
import '../../../Constants/imagesConstant.dart';
import '../../../Constants/routeConstant.dart';
import '../../../CustomWidgets/CommonButton.dart';
import '../../../CustomWidgets/commonTextField.dart';
import '../../../Helper/alertMessage.dart';
import '../../../Helper/genericMethods.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Utils/validator.dart';
import 'Widgtes/otpVarificationScreen.dart';
import 'Widgtes/socialLoginView.dart';
import 'bloc/loginScreenBloc.dart';
import 'bloc/loginScreenEvents.dart';

class LoginScreen extends StatefulWidget {
  bool isFromStart;

  LoginScreen({Key? key, this.isFromStart = true}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController,
      passwordController,
      phoneController;
  late GlobalKey<FormState> _formKey;
  late bool isLoading, isOtpVerification;
  LoginScreenBloc? loginScreenBloc;
  String otpExpireTime = '1';

  void initState() {
    loginScreenBloc = context.read<LoginScreenBloc>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    _formKey = GlobalKey();
    isLoading = false;
    isOtpVerification = false;

    super.initState();
  }

  void _validateForm({bool isPhoneLogin = true}) async {
    GenericMethods.hideSoftKeyBoard();
    if (_formKey.currentState?.validate() == true) {
      if (isPhoneLogin) {
        loginScreenBloc?.add(LoginScreenGenerateOtpEvent(GenerateOtpRequest(
            phone: phoneController.text,
            action: AppConstant.generateOtp,
            lang: storageController.getCurrentLanguage(),
            currencyCode: storageController.getCurrentCurrency())));
      } else {
        loginScreenBloc?.add(LoginScreenSubmitEvent(
            phoneController.text, passwordController.text));
      }
    } else {
      print("------${phoneController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isOtpVerification) {
          loginScreenBloc?.add(LoginScreenValueChangeEvent(isOtpVerification));
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: BlocBuilder<LoginScreenBloc, LoginScreenState>(
          builder: (context, state) {
            if (state is LoginScreenLoadingState) {
              isLoading = true;
            } else if (state is LoginScreenSuccessState) {
              isLoading = false;
              // storageController.setPassword(passwordController.text.toString());

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if ((state.data.userId ?? '') != '') {
                  TabbarController.countController.sink
                      .add(state.data.productTotal ?? 0);
                  storageController.setBadgeCount(state.data.productTotal);
                  storageController.saveIsLoggedIn(true);
                  storageController.setUserData(state.data);
                  isOtpVerification = false;
                  AlertMessage.showSuccess(
                      GenericMethods.getStringValue(
                          context, AppStringConstant.loginSuccess),
                      context);
                  Navigator.pushReplacementNamed(context, storeSelection,
                      arguments: true);
                } else {
                  isOtpVerification = false;
                  AlertMessage.showSuccess(state.data.message ?? '', context);
                  Navigator.pushNamed(context, signup, arguments: true);
                }
              });
            } else if (state is LoginScreenErrorState) {
              isLoading = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showError(state.message ?? '', context);
              });
            } else if (state is LoginForgotPasswordState) {
              isLoading = false;
              isOtpVerification = false;

              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showSuccess(state.data.message ?? '', context);
              });
            } else if (state is LoginScreenOtpSentState) {
              isLoading = false;
              isOtpVerification = true;
              otpExpireTime = state.response?.expireTime ?? '1';
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showSuccess(state.response?.msg ?? '', context);
              });
            } else if (state is LoginScreenValueChangeState) {
              isLoading = false;
              isOtpVerification = state.value;
            }
            loginScreenBloc?.emit(LoginScreenEmptyState());
            return buildMainUI();
          },
        ),
      ),
    );
  }

  Widget buildMainUI() {
    return ignorePointer(
      ignoring: isLoading,
      child: Stack(
        children: [
          (isOtpVerification)
              ? OtpVerificationScreen(
                  callback: (value) {
                    loginScreenBloc?.add(LoginScreenVerifyOtpEvent(
                        GenerateOtpRequest(
                            phone: phoneController.text,
                            action: AppConstant.verifyOtp,
                            lang: storageController.getCurrentLanguage(),
                            currencyCode:
                                storageController.getCurrentCurrency(),
                            otp: value)));
                  },
                  backCallBack: () {
                    print('object');
                    loginScreenBloc
                        ?.add(LoginScreenValueChangeEvent(isOtpVerification));
                  },
                  phoneNumber: phoneController.text,
                  reSendCallback: () {
                    print('resend callback');
                    loginScreenBloc?.add(LoginScreenGenerateOtpEvent(
                        GenerateOtpRequest(
                            phone: phoneController.text,
                            action: AppConstant.generateOtp,
                            lang: storageController.getCurrentLanguage(),
                            currencyCode:
                                storageController.getCurrentCurrency())));
                  },
                  otpExpireTime: otpExpireTime)
              : Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.extraPadding,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height:
                                AppSizes.maximumPadding + AppSizes.appBarSize,
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
                                letterSpacing: -0.5),
                          ),
                          const SizedBox(
                            height: AppSizes.mediumPadding,
                          ),
                          Text(
                            GenericMethods.getStringValue(
                                context,
                                GenericMethods.getStringValue(
                                    context, AppStringConstant.loginText1)!),
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'SF-Pro-Display',
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                              height: AppSizes.splashScreenTitleFontSize +
                                  10.toDouble()),
                          LoginTextField(
                            controller: phoneController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            isPassword: false,
                            isPhone: false,
                            validator: (value) {
                              if (!phoneController.text.contains('@')) {
                                if (value == null || value.toString().isEmpty) {
                                  return "${GenericMethods.getStringValue(context, AppStringConstant.phone)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                                }

                                if (Validator.isValidPhoneNumber(
                                        value, context) !=
                                    null) {
                                  return Validator.isValidPhoneNumber(
                                          value, context) ??
                                      "";
                                }
                              } else {
                                if (value == null || value.toString().isEmpty) {
                                  return "${GenericMethods.getStringValue(context, AppStringConstant.email)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                                }

                                if (Validator.isEmailValid(value, context) !=
                                    null) {
                                  return Validator.isEmailValid(
                                          value, context) ??
                                      "";
                                }
                              }
                            },
                            hint: GenericMethods.getStringValue(
                                context, AppStringConstant.login),
                            title: GenericMethods.getStringValue(
                                context, AppStringConstant.login),
                          ),
                          const SizedBox(
                            height: AppSizes.size30,
                          ),
                          if (phoneController.text.contains('@'))
                            LoginTextField(
                              controller: passwordController,
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.toString().isEmpty) {
                                  return "${GenericMethods.getStringValue(context, AppStringConstant.password)} ${GenericMethods.getStringValue(context, AppStringConstant.isRequired)}";
                                }

                                if (Validator.isValidPassword(value, context) !=
                                    null) {
                                  return Validator.isValidPassword(
                                          value, context) ??
                                      "";
                                }
                              },
                              hint: GenericMethods.getStringValue(
                                  context, AppStringConstant.password),
                            ),
                          if (phoneController.text.contains('@'))
                            const SizedBox(
                              height: AppSizes.size30,
                            ),
                          commonButton(context, () {
                            _validateForm(
                                isPhoneLogin:
                                    !phoneController.text.contains('@'));
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 16,
                                          color: AppColors.lightGray),
                                ),
                              ),
                              const Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                          const SizedBox(
                            height: AppSizes.extraPadding * 2,
                          ),
                          SocialLoginView(loginScreenBloc!),
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
                                  GenericMethods.getStringValue(context,
                                      AppStringConstant.doNotHaveAnAccountYet),
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
                                ),
                                const SizedBox(
                                  height: AppSizes.extraPadding * 6,
                                ),
                                GestureDetector(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          GenericMethods.getStringValue(context,
                                              AppStringConstant.remindMeLater),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,fontSize: 14,color: AppColors.blue),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      StorageController()
                                          .setLoginReminder(true);
                                      Navigator.pushReplacementNamed(
                                          context, storeSelection,
                                          arguments: true);
                                    }),
                              ],
                            ),
                          ),
                          // const SizedBox(
                          //   height: AppSizes.extraPadding * 6,
                          // ),
                          // Visibility(
                          //   visible: widget.isFromStart,
                          //   child: GestureDetector(
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Text(
                          //             GenericMethods.getStringValue(context,
                          //                 AppStringConstant.remindMeLater),
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .bodyMedium
                          //                 ?.copyWith(
                          //                     fontWeight: FontWeight.w600),
                          //           ),
                          //         ],
                          //       ),
                          //       onTap: () {
                          //         StorageController().setLoginReminder(true);
                          //         Navigator.pushReplacementNamed(
                          //             context, storeSelection,
                          //             arguments: true);
                          //       }),
                          // ),
                          // SizedBox(
                          //   height: AppSizes.width / 6,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
          Visibility(visible: isLoading, child: const Loader())
        ],
      ),
    );
  }
}
