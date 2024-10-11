import 'package:equatable/equatable.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OtpModels/generateOtpRequest.dart';

import '../../../../Models/LoginSignupModels/Requests/forgot_password_request.dart';
import '../../../../Models/LoginSignupModels/Requests/social_login_request.dart';
import '../../../../Models/ValidateEmailModel/Request/validate_email_request.dart';

abstract class LoginScreenEvents extends Equatable{

}

class LoginScreenSubmitEvent extends LoginScreenEvents{
   LoginScreenSubmitEvent(this.userId,this.userPassword);

  final String userId;
  final String userPassword;

   @override
   List<Object> get props => [userId,userPassword];
}

class LoginScreenForgotPasswordEvent extends LoginScreenEvents{
   LoginScreenForgotPasswordEvent(this.forgotPasswordRequest);

  final ForgotPasswordRequest forgotPasswordRequest;

  @override
  List<Object> get props => [forgotPasswordRequest];
}

class SocialLoginEvent extends LoginScreenEvents {
   SocialLoginEvent(this.request);

  final SocialLoginRequest request;

  @override
  List<Object> get props => [request];
}

class ValidateEmailEvent extends LoginScreenEvents {
   ValidateEmailEvent(this.request);

  final ValidateEmailRequest request;

  @override
  List<Object> get props => [];
}

class LoginScreenGenerateOtpEvent extends LoginScreenEvents{
GenerateOtpRequest request;
LoginScreenGenerateOtpEvent(this.request);

  @override
  // implement props
  List<Object?> get props => throw UnimplementedError();
}
class LoginScreenVerifyOtpEvent extends LoginScreenEvents{
  GenerateOtpRequest request;
  LoginScreenVerifyOtpEvent(this.request);

  @override
  // implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginScreenValueChangeEvent extends LoginScreenEvents{
  bool value;
  LoginScreenValueChangeEvent(this.value);

  @override
  // implement props
  List<Object?> get props => throw UnimplementedError();
}

