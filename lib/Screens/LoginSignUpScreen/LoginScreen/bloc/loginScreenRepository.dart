import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/OtpModels/generateOtpRequest.dart';

import '../../../../Constants/appConstants.dart';
import '../../../../Helper/storageHelper.dart';
import '../../../../Models/LoginSignupModels/Requests/forgot_password_request.dart';
import '../../../../Models/LoginSignupModels/Requests/social_login_request.dart';
import '../../../../Models/LoginSignupModels/login_response.dart';
import '../../../../Models/OtpModels/generateOtpResponse.dart';
import '../../../../NetworkManager/api_client.dart';
import '../../../../Models/ValidateEmailModel/validate_email_response.dart';
import '../../../../Models/ValidateEmailModel/Request/validate_email_request.dart';



abstract class LoginScreenRepository{
  Future<LoginResponse>? login(String userId,String userPassword);

  Future<LoginResponse>? forgotPassword(ForgotPasswordRequest forgotPasswordRequest);
  Future<LoginResponse>? socialLogin(SocialLoginRequest socialLoginRequest);
  Future<ValidateEmailResponse>? validateEmail(ValidateEmailRequest validateEmailRequest);
  Future<GenerateOtpResponse> generateOtp(GenerateOtpRequest otpRequest);
  Future<LoginResponse> verifyOtp(GenerateOtpRequest otpRequest);

}

class LoginScreenRepositoryImp extends LoginScreenRepository{


  @override
  Future<LoginResponse>? forgotPassword(ForgotPasswordRequest forgotPasswordRequest) async {
    forgotPasswordRequest.storefrontId=storageController.getStoreData()?.storefrontId??"";
    LoginResponse? model = await ApiClient(baseUrl: storageController.getStoreData()?.url).forgotCustomerPassword(
      ApiConstant.authToken,
      "application/json",
      forgotPasswordRequest,
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
    );
    return model;
  }

  @override
  Future<LoginResponse>? login(String userId,String userPassword) async {
    LoginResponse? model = await ApiClient(baseUrl: storageController.getStoreData()?.url).customerLogin(
      userId,
      userPassword,
      (storageController.getUserData()?.userId??'').toString() ?? '',
      storageController.getFirebaseToken(),
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
        storageController.getStoreData()?.storefrontId.toString()??""
    );
    return model;
  }

  @override
  Future<LoginResponse>? socialLogin(SocialLoginRequest socialLoginRequest) async {
    socialLoginRequest.chatToken=storageController.getFirebaseToken();
    socialLoginRequest.storefrontId=storageController.getStoreData()?.storefrontId??"";
    print('-------> social repo ');
    LoginResponse? model = await ApiClient(baseUrl: storageController.getStoreData()?.url).customerSocialLogin(
      ApiConstant.authToken,
      "application/json",
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
      socialLoginRequest,
    );

    print('response------> $model');
    return model;
  }

  @override
  Future<ValidateEmailResponse>? validateEmail(ValidateEmailRequest validateEmailRequest) async{
    ValidateEmailResponse response=await ApiClient(baseUrl: storageController.getStoreData()?.url).validateEmailId(ApiConstant.authToken,
        "application/json", validateEmailRequest);
    return response;
  }

  @override
  Future<GenerateOtpResponse> generateOtp(GenerateOtpRequest otpRequest)async{
    GenerateOtpResponse response= await ApiClient(baseUrl: storageController.getStoreData()?.url).generateOtp(otpRequest);
    return response;
    }

  @override
  Future<LoginResponse> verifyOtp(GenerateOtpRequest otpRequest)async{
    LoginResponse response= await ApiClient(baseUrl: storageController.getStoreData()?.url).verifyOtp(otpRequest);
    return response;
  }
}
