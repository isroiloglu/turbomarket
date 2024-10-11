import 'package:flutter/foundation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/NetworkManager/api_client.dart';

import '../../../Constants/appConstants.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/CategoryProductData/category_product_data_model.dart';
import '../../../Models/HomePageModels/product_filters.dart';

abstract class CatalogRepository {
  Future<CategoryProductsDataModel> getCatalogProductData(String categoryId,
      String variantId, int page, sortBy, sortOrder, featureHash);

  Future<CategoryProductsDataModel> getHomePageProductData(
      String categoryId, int page, sortBy, sortOrder, featureHash);

  Future<ProductFiltersModel?> getFilters(String categoryId);

  Future<CategoryProductsDataModel> getCountryProducts(String countryId);
}

class CatalogDataImp implements CatalogRepository {
  @override
  Future<CategoryProductsDataModel> getCatalogProductData(String categoryId,
      String variantId, int page, sortBy, sortOrder, featureHash) async {
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .getCategoryData(
      categoryId,
      variantId,
      ((storageController.getUserData()?.userId ?? '').toString() ?? '')
          .toString(),
      AppSizes.width.toInt(),
      page,
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
  Future<CategoryProductsDataModel> getCountryProducts(String countryId) async {
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .getCountryProductData(
            storageController.getStoreData()?.storefrontId.toString() ?? '',
            storageController.getCurrentCurrency(),
            storageController.getCurrentLanguage(),
            countryId,
            20,
            1);
  }

  @override
  Future<ProductFiltersModel?> getFilters(String categoryId) async {
    ProductFiltersModel? res;
    try {
      return res =
          await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
              .getProductFilters(
                  "category_product_filter",
                  categoryId,
                  AppSizes.width.toInt(),
                  storageController.getCurrentLanguage(),
                  storageController.getCurrentCurrency(),
                  storageController.getStoreData()!.storefrontId.toString());
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return res;
  }

  @override
  Future<CategoryProductsDataModel> getHomePageProductData(
      String categoryId, int page, sortBy, sortOrder, featureHash) async {
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .getHomePageProductData(
            categoryId,
            ((storageController.getUserData()?.userId ?? '').toString() ?? '')
                .toString(),
            AppSizes.width.toInt(),
            page,
            sortBy,
            sortOrder,
            featureHash,
            storageController.getCurrentLanguage(),
            storageController.getCurrentCurrency(),
            storageController.getStoreData()!.storefrontId.toString());
  }
}
