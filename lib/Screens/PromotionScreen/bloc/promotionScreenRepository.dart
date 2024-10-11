import 'package:world_miral_cs_cart_multivendor_flutter_app/NetworkManager/api_client.dart';

import '../../../Helper/storageHelper.dart';
import '../../../Models/PromotionsModel/promotionResponse.dart';

abstract class PromotionScreenRepository{
  Future<PromotionResponse> fetchPromotionList(int pageNumber);
}

class PromotionScreenRepositoryImp extends PromotionScreenRepository{
  @override
  Future<PromotionResponse> fetchPromotionList(int pageNumber) async {
    return ApiClient(baseUrl: (storageController.getStoreData()?.url!)).getPromotionList((storageController.getStoreData()?.storefrontId)??"", 10, pageNumber,storageController.getCurrentLanguage(),storageController.getCurrentCurrency());
  }

}