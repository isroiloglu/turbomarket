import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/AppBar/commonAppBar.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/CommonWidgets/IgnotePointer/ignorePointer.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ForgotPasswordScreen/bloc/forgotPasswordBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/ForgotPasswordScreen/bloc/forgotPasswordEvents.dart';

import '../../Config/theme.dart';
import '../../Constants/appConstants.dart';
import '../../Constants/appStringConstants.dart';
import '../../Constants/imagesConstant.dart';
import '../../CustomWidgets/CommonButton.dart';
import '../../CustomWidgets/commonTextField.dart';
import '../../Helper/alertMessage.dart';
import '../../Helper/genericMethods.dart';
import '../../Helper/loader.dart';
import '../../Helper/storageHelper.dart';
import '../../Models/LoginSignupModels/Requests/forgot_password_request.dart';
import '../../Utils/validator.dart';
import 'bloc/forgotPasswordStates.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordBloc? forgotPasswordBloc;
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isLoading = false;

  void _validateForm() async {
    GenericMethods.hideSoftKeyBoard();
    if (_formKey.currentState?.validate() == true) {
      var request=ForgotPasswordRequest();
      request.email=emailController.text.toString();
      request.forgotPassword = true;
      request.languageCode =storageController.getCurrentLanguage();
      request.currencyCode =storageController.getCurrentCurrency();
      forgotPasswordBloc?.add(ForgotPasswordSubmitEvent(request));
    }
  }

  @override
  void initState() {
    forgotPasswordBloc = context.read<ForgotPasswordBloc>();
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobikulTheme.lightGreyTest,

      appBar:
      PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.size73),
        child: commonAppBar(context, true, GenericMethods.getStringValue(context, AppStringConstant.back), false,showSearch: false),
      ),

      body: BlocBuilder<ForgotPasswordBloc, ForgotPasswordStates>(
        builder: (context, state) {
          if (state is ForgotPasswordLoadingState) {
            isLoading = true;
          } else if (state is ForgotPasswordSuccessState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showSuccess(state.data.message ?? "", context);
            });
          } else if (state is ForgotPasswordErrorState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(state.message ?? '', context);
            });
          }
          forgotPasswordBloc?.emit(ForgotPasswordEmptyState());
          return SafeArea(child: buildMainUI());
        },
      ),
    );
  }

  Widget buildMainUI() {
    return ignorePointer(
        ignoring: isLoading,
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.extraPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                 //   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.asset(
                              height: AppSizes.width / 6,
                              width: AppSizes.width / 1.5,
                              AppImages.logo)),
                       SizedBox(height: AppSizes.width/5),
                      Text(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.forgotPassword),
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: AppSizes.sidePadding),
                      Text(
                        GenericMethods.getStringValue(
                            context, AppStringConstant.forgotPasswordMessage),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                      ),
                      const SizedBox(height: AppSizes.size40),
                      CommonTextField(
                        controller: emailController,
                        isPassword: false,
                        hint: GenericMethods.getStringValue(
                            context, AppStringConstant.hintEmail),
                        maxLine: 1,
                        minLine: 1,
                        isPhone: false,
                        onSave: (value) {

                        },
                        validator: (value) {
                          if (value != null) {
                            if (Validator.isEmailValid(value, context) != null) {
                              return GenericMethods.getStringValue(context,Validator.isEmailValid(value, context) ?? "");
                            }
                          }
                          return null;
                        },
                        title: GenericMethods.getStringValue(
                            context, AppStringConstant.email),
                      ),
                      const SizedBox(height: AppSizes.size40),
                      commonButton(
                          context,
                          _validateForm,
                          GenericMethods.getStringValue(
                              context, AppStringConstant.sendEmail),
                          textColor: AppColors.white,fontWeight: FontWeight.w600),
                      const SizedBox(height: AppSizes.size40),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          GenericMethods.getStringValue(
                              context, AppStringConstant.backToLogin),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(visible: isLoading, child: const Loader())
          ],
        ));
  }
}
