import '../../../../Constants/appConstants.dart';
import '../../../../Helper/storageHelper.dart';
import '../../../../Models/LoginSignupModels/Requests/register_request.dart';
import '../../../../Models/LoginSignupModels/login_response.dart';
import '../../../../NetworkManager/api_client.dart';
import '../../../../Models/ValidateEmailModel/validate_email_response.dart';
import '../../../../Models/ValidateEmailModel/Request/validate_email_request.dart';

abstract class SignUpScreenRepository{
  Future<LoginResponse?>? registerAccountRequest(RegisterAccountRequest registerAccountRequest);
  Future<ValidateEmailResponse>? validateEmail(ValidateEmailRequest validateEmailRequest);

}

class SignUpScreenRepositoryImp extends SignUpScreenRepository{
  @override
  Future<LoginResponse?>? registerAccountRequest(RegisterAccountRequest registerAccountRequest) async {
    registerAccountRequest.storefrontId=storageController.getStoreData()?.storefrontId??"";
    LoginResponse? model;
    try{
      model = await ApiClient(baseUrl: storageController.getStoreData()?.url).registerAccount(
        ApiConstant.authToken,
        "application/json",
        registerAccountRequest,
        storageController.getCurrentLanguage(),
        storageController.getCurrentCurrency(),
      );
    }catch(e,err){
      print("$e\n$err");
    }
    return model;
  }

  @override
  Future<ValidateEmailResponse>? validateEmail(ValidateEmailRequest validateEmailRequest) async {
    ValidateEmailResponse response=await ApiClient(baseUrl: storageController.getStoreData()?.url).validateEmailId(ApiConstant.authToken,
        "application/json", validateEmailRequest);
    return response;
  }

}