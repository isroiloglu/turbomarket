import '../../../../Constants/appConstants.dart';
import '../../../../Helper/storageHelper.dart';
import '../../../../Models/ProductDetailModels/request/add_to_cart_request.dart';
import '../../../../Models/ProductDetailModels/response/add_to_cart_response_model.dart';
import '../../../../Models/WishlistModels/response/wishlisht_response_model.dart';
import '../../../../Models/baseResponse/base_response.dart';
import '../../../../NetworkManager/api_client.dart';

abstract class ItemCardRepository {
  // Future<AddToCartResponseModel> addToCartPost(AddToCartRequest request);

  Future<WishListResponseModel> addToWishListPost(AddToCartRequest request);

  Future<BaseResponse> deleteItemFromWishlist(String itemId);
}

class ItemCardRepositoryImp implements ItemCardRepository {
  @override
  Future<AddToCartResponseModel> addToCartPost(AddToCartRequest request) async {
    request.storefrontId = storageController.getStoreData()?.storefrontId ?? "";
    if ((storageController.getUserData()?.userId ?? '').toString() == null ||
        (storageController.getUserData()?.userId ?? '').toString() == "") {
      return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
          .addToCartPost(
              ((storageController.getUserData()?.userId ?? '').toString() ?? '')
                  .toString(),
              AppSizes.width.toInt(),
              storageController.getCurrentLanguage(),
              storageController.getCurrentCurrency(),
              request.toJson());
    } else {
      return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
          .addToCartPut(
              ((storageController.getUserData()?.userId ?? '').toString() ?? '')
                  .toString(),
              AppSizes.width.toInt(),
              storageController.getCurrentLanguage(),
              storageController.getCurrentCurrency(),
              request.toJson());
    }
  }

  @override
  Future<WishListResponseModel> addToWishListPost(
      AddToCartRequest request) async {
    if (storageController.getUserData()?.userId == null ||
        storageController.getUserData()?.userId == "") {
      return await ApiClient(baseUrl: storageController.getStoreData()?.url!)
          .addtoWishlistPost(
              ApiConstant.authToken,
              "application/json",
              (storageController.getUserData()?.userId ?? '').toString(),
              AppSizes.width.toInt(),
              storageController.getCurrentLanguage(),
              storageController.getCurrentCurrency(),
              request.toJson());
    } else {
      return await ApiClient(baseUrl: storageController.getStoreData()?.url!)
          .addtoWishlistPut(
              ApiConstant.authToken,
              "application/json",
              (storageController.getUserData()?.userId ?? '').toString(),
              AppSizes.width.toInt(),
              storageController.getCurrentLanguage(),
              storageController.getCurrentCurrency(),
              request.toJson());
    }
  }

  @override
  Future<BaseResponse> deleteItemFromWishlist(String itemId) async {
    BaseResponse? model;
    model = await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .deleteWishlistItem(
            (storageController.getUserData()?.userId ?? '').toString(),
            itemId,
            AppSizes.width.toInt(),
            storageController.getCurrentLanguage(),
            storageController.getCurrentCurrency(),
            storageController.getStoreData()!.storefrontId.toString());

    return model;
  }
}
