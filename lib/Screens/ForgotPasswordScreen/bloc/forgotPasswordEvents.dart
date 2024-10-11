import 'package:equatable/equatable.dart';

import '../../../Models/LoginSignupModels/Requests/forgot_password_request.dart';

abstract class ForgotPasswordEvent extends Equatable{

}

class ForgotPasswordSubmitEvent extends ForgotPasswordEvent {
  ForgotPasswordSubmitEvent(this.forgotPasswordRequest);

  final ForgotPasswordRequest forgotPasswordRequest;

  @override
  List<Object> get props => [forgotPasswordRequest];
}