import 'dart:developer';

import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/storageHelper.dart';

import '../../../Constants/appConstants.dart';
import '../../../Models/ProductDetailModels/request/add_to_cart_request.dart';
import '../../../Models/ProductDetailModels/response/add_to_cart_response_model.dart';
import '../../../Models/ProductDetailModels/response/product_detail_model.dart';
import '../../../Models/ProductDetailModels/response/reviews_data.dart';
import '../../../Models/WishlistModels/response/wishlisht_response_model.dart';
import '../../../Models/baseResponse/base_response.dart';
import '../../../NetworkManager/api_client.dart';

abstract class ProductScreenRepository {
  Future<ProductDetailModel?> getProductData(String? id);

  Future<ReviewsData?> getProductReview(int? id);

  Future<AddToCartResponseModel> addToCartPost(AddToCartRequest request);

  Future<WishListResponseModel> addToWishListPost(AddToCartRequest request);

  Future<BaseResponse> deleteItemFromWishlist(String itemId);

  int increaseQty(int qty);

  int decreaseQty(int qty);
}

class ProductScreenRepositoryImp implements ProductScreenRepository {
  @override
  Future<ProductDetailModel?> getProductData(String? id) async {
    ProductDetailModel? data;
    try {
      data = await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
          .getProductDataNew(
              id!,
              ((storageController.getUserData()?.userId ?? '').toString() ?? '')
                  .toString(),
              AppSizes.width.toInt(),
              storageController.getCurrentLanguage(),
              storageController.getCurrentCurrency(),
              storageController.getStoreData()!.storefrontId.toString());
      log('DATA IS $data');
    } catch (err, stk) {
      print(stk);
    }
    return data;
  }

  @override
  Future<ReviewsData?> getProductReview(int? id) async {
    ReviewsData? model;
    try {
      model = await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
          .getProductReviewData(id!, 1, "review_data",
              storageController.getStoreData()!.storefrontId.toString());
    } catch (err, stk) {
      print(stk);
    }
    return model;
  }

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
    request?.storefrontId =
        storageController.getStoreData()?.storefrontId ?? "";
    if ((storageController.getUserData()?.userId ?? '').toString() == null ||
        (storageController.getUserData()?.userId ?? '').toString() == "") {
      return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
          .addtoWishlistPost(
              ApiConstant.authToken,
              "application/json",
              ((storageController.getUserData()?.userId ?? '').toString() ?? '')
                  .toString(),
              AppSizes.width.toInt(),
              storageController.getCurrentLanguage(),
              storageController.getCurrentCurrency(),
              request.toJson());
    } else {
      return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
          .addtoWishlistPut(
              ApiConstant.authToken,
              "application/json",
              ((storageController.getUserData()?.userId ?? '').toString() ?? '')
                  .toString(),
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

  @override
  int increaseQty(int qty) {
    return qty;
  }

  @override
  int decreaseQty(int qty) {
    return qty;
  }
}
