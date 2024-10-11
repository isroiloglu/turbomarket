

import '../../../Constants/appConstants.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/Reviews/reviewRequest.dart';
import '../../../Models/Reviews/reviewResponse.dart';
import '../../../NetworkManager/api_client.dart';

abstract class AddReviewRepository{
  Future<ReviewResponse> addReview(SubmitReviewRequest reviewRequest, String productId);
}
class AddReviewRepositoryImp implements AddReviewRepository{

  @override
  Future<ReviewResponse> addReview(SubmitReviewRequest reviewRequest, String productId) async{
    print("REVIEW REQUEST-------->${reviewRequest.reviewData?.toJson()}");
    reviewRequest.storefrontId=storageController.getStoreData()?.storefrontId??"";
    var model;
    try {
      model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).submitProductReview( ApiConstant.authToken, productId, reviewRequest.toJson());
    } catch (e, s) {
      print(s);
    }
    return model;
  }

}