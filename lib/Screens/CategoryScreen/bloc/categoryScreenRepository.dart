import '../../../Constants/appConstants.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/CategoryProductData/category_product_data_model.dart';
import '../../../Models/SubcategoryModel/subcategory_model.dart';
import '../../../NetworkManager/api_client.dart';

abstract class CategoriesScreenRepository {
  Future<CategoryProductsDataModel> getCategoryProductData(
      String categoryId, String variantId, sortBy, sortOrder, featureHash);

  Future<SubCategoryModel> getSubCategory(String parentCategoryId);
}

class CategoriesProductDataImp implements CategoriesScreenRepository {
  @override
  Future<CategoryProductsDataModel> getCategoryProductData(String categoryId,
      String variantId, sortBy, sortOrder, featureHash) async {
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .getCategoryData(
      categoryId,
      variantId,
      ((storageController.getUserData()?.userId ?? '').toString() ?? '')
          .toString(),
      AppSizes.width.toInt(),
      1,
      sortBy,
      sortOrder,
      featureHash,
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
      storageController.getStoreData()!.storefrontId.toString(),
      20,
    );
  }

  @override
  Future<SubCategoryModel> getSubCategory(String parentCategoryId) async {
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .getCategoryById(
            parentCategoryId,
            AppSizes.width.toInt(),
            storageController.getCurrentLanguage(),
            storageController.getCurrentCurrency(),
            storageController.getStoreData()!.storefrontId.toString());
  }
}
