import 'package:equatable/equatable.dart';

import '../../../../Models/LoginSignupModels/login_response.dart';
import '../../../../Models/ValidateEmailModel/validate_email_response.dart';

abstract class SignUpScreenState extends Equatable{

}

class SignUpScreenInitialState extends SignUpScreenState{
  @override
  List<Object?> get props => [];

}

class SignUpScreenLoadingState extends SignUpScreenState{
  @override
  List<Object?> get props => [];

}
class SignUpScreenSuccessState extends SignUpScreenState{
   SignUpScreenSuccessState(this.data);

  final LoginResponse data;

  @override
  List<Object> get props => [data];
}

class SignUpScreenErrorState extends SignUpScreenState{
  SignUpScreenErrorState(this._message);

  String? _message;

  String? get message => _message;

  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class ValidateEmailState extends SignUpScreenState {
  ValidateEmailResponse response;
  ValidateEmailState(this.response);

  @override
  List<Object> get props => [];
}