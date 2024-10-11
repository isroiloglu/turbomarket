import '../../../Constants/appConstants.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/LoginSignupModels/Requests/forgot_password_request.dart';
import '../../../Models/LoginSignupModels/login_response.dart';
import '../../../NetworkManager/api_client.dart';

abstract class ForgotPasswordRepository{
  Future<LoginResponse>? forgotPassword(ForgotPasswordRequest forgotPasswordRequest);

}

class ForgotPasswordRepositoryImp extends ForgotPasswordRepository{
  @override
  Future<LoginResponse>? forgotPassword(ForgotPasswordRequest forgotPasswordRequest) async {
    LoginResponse? model = await ApiClient(baseUrl: storageController.getStoreData()!.url).forgotCustomerPassword(
      ApiConstant.authToken,
      "application/json",
      forgotPasswordRequest,
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
    );
    return model;
  }
}