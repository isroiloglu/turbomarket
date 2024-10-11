import 'package:world_miral_cs_cart_multivendor_flutter_app/NetworkManager/api_client.dart';

import '../../../Constants/appConstants.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/ProductDetailModels/response/cms_page_detail.dart';

abstract class CMSScreenRepository {
  Future<CMSPageDetail> getMorePageData(String? id);
}

class CMSScreenRepositoryImp implements CMSScreenRepository {
  @override
  Future<CMSPageDetail> getMorePageData(String? id) async {

    return await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).getMorePageData(id!,AppSizes.width.toInt(),storageController.getCurrentLanguage(),storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString());
  }

}