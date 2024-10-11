import 'package:equatable/equatable.dart';

import '../../../../Models/LoginSignupModels/Requests/register_request.dart';
import '../../../../Models/ValidateEmailModel/Request/validate_email_request.dart';


abstract class SignUpScreenEvent extends Equatable{

}

class SignUpScreenSubmitEvent extends SignUpScreenEvent{
   SignUpScreenSubmitEvent(this.registerAccountRequest);

  final RegisterAccountRequest registerAccountRequest;

  @override
  List<Object> get props => [registerAccountRequest];
}

class ValidateEmailEvent extends SignUpScreenEvent {
   ValidateEmailEvent(this.request);

  final ValidateEmailRequest request;

  @override
  List<Object> get props => [];
}