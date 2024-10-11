import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/loader.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/SignUpScreen/bloc/signUpSCreenBloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/SignUpScreen/bloc/signUpScreenStates.dart';

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
import '../../../Models/LoginSignupModels/Requests/register_request.dart';
import '../../../Utils/validator.dart';
import 'bloc/signUpScreenEvents.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignupScreenBloc? signupScreenBloc;
  late TextEditingController emailController, passwordController,conformPasswordController,phoneNumberController;
  late GlobalKey<FormState> _formKey;
  late bool isLoading;

  @override
  void initState() {
    signupScreenBloc = context.read<SignupScreenBloc>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    conformPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
    _formKey = GlobalKey();
    isLoading = false;

    super.initState();
  }
  void _validateForm() async {
    GenericMethods.hideSoftKeyBoard();
    if (_formKey.currentState?.validate() == true) {
      signupScreenBloc?.add(SignUpScreenSubmitEvent(RegisterAccountRequest(email: emailController.text, password: passwordController.text, phone: phoneNumberController.text)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignupScreenBloc, SignUpScreenState>(
        builder: (context, state){
          if(state is SignUpScreenLoadingState){
            isLoading = true;
          }
          else if(state is SignUpScreenSuccessState){
            isLoading = false;
            storageController.setPassword(passwordController.text.toString());
            storageController.saveIsLoggedIn(true);
            storageController.setUserData(state.data);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showSuccess(state.data.message ?? '', context);
              Navigator.pushReplacementNamed(context, storeSelection, arguments: true);
            });
          }
          else if(state is SignUpScreenErrorState){
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(state.message ?? '', context);
            });
          }
          return buildMainUI();
        },
      ),
    );
  }

  Widget buildMainUI(){
    return ignorePointer(
        ignoring: isLoading,
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.extraPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top:AppSizes.width/8),
                        child: Center(
                            child: Image.asset(
                                height:AppSizes.width/4,
                                width:AppSizes.width/1.5,
                                AppImages.logo)
                        ),
                      ),
                      const SizedBox(height: AppSizes.sidePadding),
                      CommonTextField(
                        controller: emailController,
                        isPassword: false,
                        hint: GenericMethods.getStringValue(context,AppStringConstant.hintEmail),
                        maxLine: 1,
                        minLine: 1,
                        onSave: (value) {},
                        validator: (value) {
                          if (value != null) {
                            if (Validator.isEmailValid(value, context) != null) {
                              return  GenericMethods.getStringValue(context,Validator.isEmailValid(value, context) ?? "");
                            }
                          }
                          return null;},
                        title: GenericMethods.getStringValue(context, AppStringConstant.email),
                      ),
                      const SizedBox(height: AppSizes.extraPadding),

                      CommonTextField(
                        controller: phoneNumberController,
                        isPassword: false,
                        onSave: (value) {},
                        isPhone: true,
                        validator: (value) {
                          if (value != null) {
                            if (Validator.isValidPhoneNumber(value, context) != null) {
                              return  GenericMethods.getStringValue(context,Validator.isValidPhoneNumber(value, context) ?? "");
                            }
                          }
                          return null;},
                        hint: GenericMethods.getStringValue(context,AppStringConstant.hintPhoneNumber),
                        minLine: 1,
                        maxLine: 1,
                        title: GenericMethods.getStringValue(context, AppStringConstant.yourPhoneNumber),
                      ),
                      const SizedBox(height: AppSizes.extraPadding),
                      CommonTextField(
                        controller: passwordController,
                        isPassword: true,
                        onSave: (value) {},
                        validator: (value) {
                          if (value != null) {
                            if (Validator.isValidPassword(value, context) != null) {
                              return  GenericMethods.getStringValue(context,Validator.isValidPassword(value, context) ?? "");
                            }
                          }
                          return null;},
                        hint: GenericMethods.getStringValue(context,AppStringConstant.hintYourPassword),
                        showPasswordButton: true,
                        minLine: 1,
                        maxLine: 1,
                        title: GenericMethods.getStringValue(context, AppStringConstant.password),
                      ),
                      const SizedBox(height: AppSizes.extraPadding),

                      CommonTextField(
                        controller: conformPasswordController,
                        isPassword: true,
                        onSave: (value) {},
                        validator: (value) {
                          if (value != null) {
                            if (value != passwordController.text) {
                              return  GenericMethods.getStringValue(context,AppStringConstant.conformPasswordMessage);
                            }
                          }
                          return null;},
                        hint: GenericMethods.getStringValue(context,AppStringConstant.hintYourPassword),

                        showPasswordButton: true,
                        minLine: 1,
                        maxLine: 1,
                        title: GenericMethods.getStringValue(context, AppStringConstant.enterYourPasswordAgain),
                      ),
                      const SizedBox(height: AppSizes.extraPadding*3),
                      commonButton(
                        context,
                        _validateForm,
                        GenericMethods.getStringValue(context, AppStringConstant.signUp),
                        //   Theme.of(context).colorScheme.primary,
                        textColor:Colors.white,
                        //Theme.of(context).colorScheme.secondary
                      ),
                      const SizedBox(height: AppSizes.extraPadding*3),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(GenericMethods.getStringValue(context, AppStringConstant.haveAnAccount),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text(" ${GenericMethods.getStringValue(context, AppStringConstant.login)}",style: Theme.of(context).textTheme.bodyLarge,),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.extraPadding*6,
                      ),
                      GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                GenericMethods.getStringValue(context, AppStringConstant.remindMeLater),
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          onTap: () {
                            StorageController().setLoginReminder(true);
                            Navigator.pushReplacementNamed(context, storeSelection, arguments: true);
                          }
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isLoading,
                child: const Loader())
          ],
        )
    );
  }

}
