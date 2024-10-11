import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/SignUpScreen/bloc/signUpScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/SignUpScreen/bloc/signUpScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/LoginSignUpScreen/SignUpScreen/bloc/signUpScreenStates.dart';
import '../../../../Helper/storageHelper.dart';
import '../../../../Models/LoginSignupModels/Requests/register_request.dart';


class SignupScreenBloc
    extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  SignUpScreenRepository? repository;

  SignupScreenBloc({this.repository}) : super(SignUpScreenInitialState()) {
    on<SignUpScreenEvent>(mapEventToState);
  }

  void mapEventToState(SignUpScreenEvent event, Emitter<SignUpScreenState> emit,) async {
    emit(SignUpScreenLoadingState());
    switch (event.runtimeType) {
      case SignUpScreenSubmitEvent:
        RegisterAccountRequest registerAccountRequest = RegisterAccountRequest();
        registerAccountRequest.email = (event as SignUpScreenSubmitEvent).registerAccountRequest.email;
        registerAccountRequest.password = (event).registerAccountRequest.password;
        registerAccountRequest.phone=event.registerAccountRequest.phone;
        registerAccountRequest.confirmPassword = registerAccountRequest.password;
        registerAccountRequest.guestId = ((storageController.getUserData()?.userId??'').toString()??'').toString();
        registerAccountRequest.companyId = storageController.getUserData()?.companyId??"";
        registerAccountRequest.customerType = storageController.getUserData()?.userType??"C" ;
        registerAccountRequest.languageCode = storageController.getCurrentLanguage()??"";
        registerAccountRequest.currencyCode =storageController.getCurrentCurrency()??"";
        registerAccountRequest.chatToken=storageController.getFirebaseToken()??"";
        try {
          var model = await repository
              ?.registerAccountRequest(registerAccountRequest);
          if (model != null) {
            if (model.error==false && model.userId!=null) {

              storageController.saveIsLoggedIn(true);
              storageController.setUserData(model);
              emit(SignUpScreenSuccessState(model));
            } else {
              emit(SignUpScreenErrorState(model.message??""));
            }
          } else {
            emit(SignUpScreenErrorState(""));
          }
        } catch (error, _) {
          emit(SignUpScreenErrorState(error.toString()));
        }
        break;
      case ValidateEmailEvent:
        emit(SignUpScreenLoadingState());
        try {
          var model = await repository?.validateEmail((event as ValidateEmailEvent).request);
          if (model != null) {
            if (model.success) {
              emit(ValidateEmailState(model));
            } else {
              emit(SignUpScreenErrorState(model.message));
            }
          } else {
            emit(SignUpScreenErrorState(""));
          }}catch(error,errorReason){
          emit(SignUpScreenErrorState(error.toString()));
        }
        break;
      default:
        {}
    }
  }
}