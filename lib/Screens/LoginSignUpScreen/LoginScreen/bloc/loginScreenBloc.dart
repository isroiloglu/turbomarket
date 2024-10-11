import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/LoginSignupModels/Requests/forgot_password_request.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/loginScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/loginScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/LoginScreen/bloc/loginScreenStates.dart';

import '../../../../Helper/storageHelper.dart';
import '../../../../Models/OtpModels/generateOtpResponse.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvents, LoginScreenState> {
  LoginScreenRepositoryImp? repository;

  LoginScreenBloc({this.repository}) : super(LoginScreenInitialState()) {
    on<LoginScreenEvents>(mapEventToState);
  }

  void mapEventToState(LoginScreenEvents event, Emitter<LoginScreenState> emit,) async {
    emit(LoginScreenLoadingState());
    switch (event.runtimeType) {
      case LoginScreenForgotPasswordEvent:
        emit(LoginScreenLoadingState());
        ForgotPasswordRequest forgotPasswordRequest = ForgotPasswordRequest();
        forgotPasswordRequest.email = (event as LoginScreenForgotPasswordEvent)
            .forgotPasswordRequest
            .email;
        forgotPasswordRequest.forgotPassword = true;
        forgotPasswordRequest.languageCode =
            storageController.getCurrentLanguage();
        forgotPasswordRequest.currencyCode =
            storageController.getCurrentCurrency();
        try {
          var model = await repository?.forgotPassword(forgotPasswordRequest);
          if (model != null) {
            if (model.error == null) {
              emit(LoginForgotPasswordState(model));
            } else {
              emit(LoginScreenErrorState(model.message ?? ""));
            }
          } else {
            emit(LoginScreenErrorState(""));
          }
        } catch (error, _) {
          emit(LoginScreenErrorState(error.toString()));
        }
        break;
      case LoginScreenSubmitEvent:
        emit(LoginScreenLoadingState());
        try {
          var model = await repository?.login((event as LoginScreenSubmitEvent).userId, (event).userPassword);
          if (model != null) {
            if (model.error == null) {
              storageController.saveIsLoggedIn(true);
              storageController.setUserData(model);
              emit(LoginScreenSuccessState(model));
            } else {
              emit(LoginScreenErrorState(model.message));
            }
          } else {
            emit(LoginScreenErrorState("i am emiting"));
          }
        } catch (error, stk) {
          print(stk);
          emit(LoginScreenErrorState(error.toString()));
        }
        break;

      case SocialLoginEvent:
        emit(LoginScreenLoadingState());
        try {
          var model = await repository
              ?.socialLogin((event as SocialLoginEvent).request);

          if (model != null && model.email != null) {
            storageController.saveIsLoggedIn(true);
            storageController.setUserData(model);
            storageController.setSocialLoginStatus(true);
            emit(LoginScreenSuccessState(model));
          } else {
            emit(LoginScreenErrorState("Sign in Failed"));
          }
        } catch (error, _) {
          emit(LoginScreenErrorState(error.toString()));
        }
        break;

      case ValidateEmailEvent:
        emit(LoginScreenLoadingState());
        try {
          var model = await repository
              ?.validateEmail((event as ValidateEmailEvent).request);
          if (model != null) {
            if (model.success) {
              emit(ValidateEmailState(model));
            } else {
              emit(LoginScreenErrorState(model.message));
            }
          } else {
            emit(LoginScreenErrorState(""));
          }
        } catch (error, errorReason) {
          emit(LoginScreenErrorState(error.toString()));
        }
        break;

      case LoginScreenGenerateOtpEvent:
        emit(LoginScreenLoadingState());
        try {
          var model = await repository?.generateOtp((event as LoginScreenGenerateOtpEvent).request);
          if (model != null) {
            if (model.success ?? false) {
              emit(LoginScreenOtpSentState(model));
            } else {
              emit(LoginScreenErrorState(model.message));
            }
          } else {
            emit(LoginScreenErrorState("i am emiting"));
          }
        } catch (error, stk) {
          print(stk);
          emit(LoginScreenErrorState(error.toString()));
        }
        break;
      case LoginScreenVerifyOtpEvent:
        emit(LoginScreenLoadingState());
        try {
          var model = await repository?.verifyOtp((event as LoginScreenVerifyOtpEvent).request);
          if (model != null) {
            if (!(model.error  ?? true) ) {
              emit(LoginScreenSuccessState(model));
            } else {
              emit(LoginScreenErrorState(model.message));
            }
          } else {
            emit(LoginScreenErrorState("i am emiting"));
          }
        } catch (error, stk) {
          print(stk);
          emit(LoginScreenErrorState(error.toString()));
        }
        break;
      case LoginScreenValueChangeEvent:
        emit(LoginScreenValueChangeState(!(event as LoginScreenValueChangeEvent).value));
        break;
      default:
        {}
    }
  }
}
