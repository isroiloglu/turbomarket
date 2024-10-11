import '../../../Constants/appConstants.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/CartModel/Request/apply_coupon.dart';
import '../../../Models/CartModel/Request/cart_request.dart';
import '../../../Models/CartModel/Request/remove_cart_item_request.dart';
import '../../../Models/CartModel/Request/remove_cart_request.dart';
import '../../../Models/CartModel/Request/update_cart_request.dart';
import '../../../Models/CartModel/cart_model.dart';
import '../../../Models/shippingEstimateModel/request/shippingEstimateRequest.dart';
import '../../../NetworkManager/api_client.dart';

abstract class CartScreenRepository {
  Future<CartModel?> getCartData(CartRequest request);

  Future<CartModel?> removeItemFromCart(RemoveCartItemRequest request);

  Future<CartModel?> removeCart(RemoveCartRequest request);

  Future<CartModel?> manageVoucher(ApplyCoupon request);

  Future<CartModel?> updateCartData(UpdateCartRequest request,
      String? customerId);
  Future<CartModel?> deletePoints(CartRequest request);
  Future<CartModel?> applyRewardPoint(CartRequest request);

  Map<String,String> increaseQty(Map<String,String> qty);
  Map<String,String> decreaseQty(Map<String,String> qty);

}

class CartScreenRepositoryImp implements CartScreenRepository {
  @override
  Future<CartModel?> getCartData(CartRequest request) async {
    print("get caart callee");
    CartModel? model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).getCartData(
        ((storageController.getUserData()?.userId??'').toString()??'').toString(),      AppSizes.width.toInt(),
      request.giftCode ?? "",
      request.walletSystem ?? 0,
      request.totalCash ?? "",
      request.subtotal ?? 0.0,
      request.formatedSubtotal ?? "",
      request.walletCartId ?? "",
      request.rechargeAmount ?? "",
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString()
    );
    return model;
  }

  @override
  Future<CartModel?> removeItemFromCart(RemoveCartItemRequest request) async {
    CartModel? model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).deleteItemFromCart(
        ((storageController.getUserData()?.userId??'').toString()??'').toString(),
      AppSizes.width.toInt(),
      request.giftCode ?? "",
      request.scope ?? "",
      request.itemId ?? "",
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString()
    );
    return model;
  }

  @override
  Future<CartModel?> removeCart(RemoveCartRequest request) async {
    CartModel? model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).deleteCart(
        ((storageController.getUserData()?.userId??'').toString()??'').toString(),
      AppSizes.width.toInt(), request.giftCode ?? "",
      request.scope ?? "",
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString()
    );
    return model;
  }

  @override
  Future<CartModel?> manageVoucher(ApplyCoupon request) async {
    CartModel? model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).applyCoupanCode(
        ((storageController.getUserData()?.userId??'').toString()??'').toString(), AppSizes.width.toInt(),
      "${storageController.getGiftCode().toList().reversed.toList()}".replaceAll(" ", ""),
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString(),
      storageController.getUsedPoint() ?? ''
    );
    return model;
  }

  @override
  Future<CartModel?> updateCartData(UpdateCartRequest request,
      String? customerId) async {
    request.storeFrontId=storageController.getStoreData()?.storefrontId??"";
    CartModel? model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).updateCart(
        customerId!, request.toJson()
    );
    return model;
  }

  @override
  Future<CartModel?> applyRewardPoint(CartRequest request)async{
    CartModel? model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).applyRewardPoint(
        storageController.getUserData()?.userId??"",
        AppSizes.width.toInt(),
        request.giftCode ?? "",
        request.walletSystem ?? 0,
        request.totalCash ?? "",
        request.subtotal ?? 0.0,
        request.formatedSubtotal ?? "",
        request.walletCartId ?? "",
        request.rechargeAmount ?? "",
        storageController.getCurrentLanguage(),
        storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString(),
      request.usedPoints ?? '0'
    );
    return model;
  }

  @override
  Future<CartModel?> deletePoints(CartRequest request) async {
    CartModel? model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).deleteRewardPoint(
      storageController.getUserData()?.userId??"",
      AppSizes.width.toInt(),
      request.giftCode ?? "",
      request.walletSystem ?? 0,
      request.totalCash ?? "",
      request.subtotal ?? 0.0,
      request.formatedSubtotal ?? "",
      request.walletCartId ?? "",
      request.rechargeAmount ?? "",
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
      storageController.getStoreData()!.storefrontId.toString(),
      request.deletedPoints ?? ''
    );
    return model;
  }



  @override
  Map<String,String> increaseQty(Map<String,String> qty) {
    return qty;
  }

  @override
  Map<String,String> decreaseQty(Map<String,String> qty) {
    return qty;
  }

}