import '../../../Helper/storageHelper.dart';
import '../../../Models/CategoryProductData/category_product_data_model.dart';
import '../../../NetworkManager/api_client.dart';

abstract class CountryProductRepository {
  Future<CategoryProductsDataModel> getCountryProducts(
      String countryId, int page);

  Future<CategoryProductsDataModel> getPromotionProducts(
      String promotionId, int pageNo);
}

class CountryProductRepositoryImp implements CountryProductRepository {
  @override
  Future<CategoryProductsDataModel> getCountryProducts(
      String countryId, int? page) async {
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .getCountryProductData(
            storageController.getStoreData()?.storefrontId.toString() ?? '',
            storageController.getCurrentCurrency(),
            storageController.getCurrentLanguage(),
            countryId,
            20,
            page ?? 1);
  }

  @override
  Future<CategoryProductsDataModel> getPromotionProducts(
      String promotionId, int pageNo) async {
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .getPromotionProducts(
            promotionId,
            storageController.getStoreData()?.storefrontId.toString() ?? '',
            storageController.getCurrentCurrency(),
            storageController.getCurrentLanguage(),
            pageNo);
  }
}
