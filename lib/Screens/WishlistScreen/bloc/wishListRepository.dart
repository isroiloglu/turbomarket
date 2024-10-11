import '../../../Constants/appConstants.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/WishlistModel/wishlist_model.dart';
import '../../../Models/baseResponse/base_response.dart';
import '../../../NetworkManager/api_client.dart';

abstract class WishlistRepository{
  Future<WishlistModel> getWishlistItems();
  Future<BaseResponse> deleteItemFromWishlist(String itemId);
  Future<BaseResponse> deleteItemCompleteWishlist();
}

class WishlistImpRepository implements WishlistRepository{
  @override
  Future<WishlistModel> getWishlistItems() async{
    WishlistModel? model;
    model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).getWishListProducts((storageController.getUserData()?.userId??'').toString() ?? '', AppSizes.width.toInt(), storageController.getCurrentLanguage(), storageController.getCurrentCurrency(),
        storageController.getStoreData()?.storefrontId.toString() ?? '');

    return model;
  }


  @override
  Future<BaseResponse> deleteItemFromWishlist(String itemId) async{
    BaseResponse? model;
    model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).deleteWishlistItem((storageController.getUserData()?.userId??'').toString(), itemId, AppSizes.width.toInt(), storageController.getCurrentLanguage(), storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString());

    return model;
  }

  @override
  Future<BaseResponse> deleteItemCompleteWishlist() async{
    BaseResponse? model;
    model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).deleteWishlistComplete((storageController.getUserData()?.userId??'').toString(),
        storageController.getStoreData()!.storefrontId.toString());

    return model;
  }
}