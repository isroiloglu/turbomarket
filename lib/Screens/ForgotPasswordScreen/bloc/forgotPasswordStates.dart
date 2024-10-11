import 'package:equatable/equatable.dart';

import '../../../Models/LoginSignupModels/login_response.dart';

abstract class ForgotPasswordStates extends Equatable{

}

class ForgotPasswordInitialState extends ForgotPasswordStates{
  @override
  List<Object> get props => [];
}

class ForgotPasswordLoadingState extends ForgotPasswordStates{
  @override
  List<Object> get props => [];
}

class ForgotPasswordSuccessState extends ForgotPasswordStates{
   ForgotPasswordSuccessState(this.data);

  final LoginResponse data;

  @override
  List<Object> get props => [data];
}

class ForgotPasswordErrorState extends ForgotPasswordStates {
  ForgotPasswordErrorState(this._message);

  String? _message;

  String? get message => _message;

  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class ForgotPasswordEmptyState extends ForgotPasswordStates{
  @override
  List<Object?> get props => [];

}