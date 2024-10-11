import 'dart:convert';

import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/createProfileRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/updateProfileRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';

import '../../../Constants/appConstants.dart';
import '../../../Models/AccountModels/Response/accountDetailResponse.dart';
import '../../../Models/LoginSignupModels/login_response.dart';
import '../../../NetworkManager/api_client.dart';

abstract class AccountScreenRepository {
  Future<AccountDetailResponse> getAccountDetails();
  Future<BaseResponse> updateProfile(String profileId,UpdateProfileRequest updateProfileRequest);
  Future<BaseResponse> deleteProfile(String profileId);
  Future<BaseResponse> createNewProfile(CreateProfileRequest createProfileRequest);
  Future<LoginResponse>? login(String userId,String userPassword);
  Future<BaseResponse> deleteCustomer(String customerId);

}

class AccountScreenRepositoryImp extends AccountScreenRepository {
  @override
  Future<AccountDetailResponse> getAccountDetails() async {
    return await ApiClient(baseUrl: storageController.getStoreData()?.url ?? "")
        .getAccountDetails((storageController.getUserData()?.userId??'').toString() ?? "",storageController.getCurrentLanguage(),storageController.getCurrentCurrency(),storageController.getStoreData()?.storefrontId??"");
  }

  @override
  Future<BaseResponse> createNewProfile(CreateProfileRequest createProfileRequest) async{
    createProfileRequest.storefrontId=storageController.getStoreData()?.storefrontId??"";
    print('profile data======> ${jsonEncode(createProfileRequest)}');

    return await ApiClient(baseUrl: storageController.getStoreData()?.url ?? "")
        .addProfiles(ApiConstant.authToken,
        "application/json", jsonEncode(createProfileRequest));
  }

  @override
  Future<BaseResponse> deleteProfile(String profileId) async{
    return await ApiClient(baseUrl: storageController.getStoreData()?.url ?? "")
        .deleteProfiles(ApiConstant.authToken,
        "application/json",(storageController.getUserData()?.userId??'').toString() ?? "",profileId,storageController.getStoreData()?.storefrontId??""
    );
  }

  @override
  Future<BaseResponse> updateProfile(String profileId, UpdateProfileRequest updateProfileRequest) async{
    updateProfileRequest.storefrontId=storageController.getStoreData()?.storefrontId??"";
    return await ApiClient(baseUrl: storageController.getStoreData()?.url ?? "")
        .updateUserProfile(ApiConstant.authToken,
        "application/json",profileId,updateProfileRequest);
  }

  @override
  Future<LoginResponse>? login(String userId,String userPassword) async {
    LoginResponse? model = await ApiClient(baseUrl: storageController.getStoreData()?.url ?? "").customerLogin(
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
  Future<BaseResponse> deleteCustomer(String customerId) async{
    return ApiClient().deleteCustomerAccount(customerId);
  }
}
