import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OtpModels/generateOtpResponse.dart';

import '../../../../Models/LoginSignupModels/login_response.dart';
import '../../../../Models/ValidateEmailModel/validate_email_response.dart';

abstract class LoginScreenState extends Equatable{

}

class LoginScreenInitialState extends LoginScreenState{
  @override
  List<Object> get props => [];
}

class LoginScreenLoadingState extends LoginScreenState{
  @override
  List<Object> get props => [];
}


class LoginScreenSuccessState extends LoginScreenState{
   LoginScreenSuccessState(this.data);

  final LoginResponse data;

  @override
  List<Object> get props => [data];
}

class LoginScreenErrorState extends LoginScreenState{
  LoginScreenErrorState(this._message);

  String? _message;

  String? get message => _message;

  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class ValidateEmailState extends LoginScreenState {
  ValidateEmailResponse response;
  ValidateEmailState(this.response);

  @override
  List<Object> get props => [];
}

class LoginScreenEmptyState extends LoginScreenState{
  @override
  List<Object> get props => [];
}

class LoginForgotPasswordState extends LoginScreenState {
   LoginForgotPasswordState(this.data);

  final LoginResponse data;

  @override
  List<Object> get props => [data];
}

class LoginScreenOtpSentState extends LoginScreenState{

  GenerateOtpResponse? response;
  LoginScreenOtpSentState(this.response);
  @override
  // implement props
  List<Object?> get props => throw UnimplementedError();

}
class LoginScreenValueChangeState extends LoginScreenState{
  bool value;
  LoginScreenValueChangeState(this.value);

  @override
  // implement props
  List<Object?> get props => throw UnimplementedError();
}

