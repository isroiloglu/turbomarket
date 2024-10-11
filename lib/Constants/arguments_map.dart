//============================Map Keys==============================//


import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';

import '../Screens/CategoryScreen/bloc/categoryScreenBloc.dart';

const shippingIdKeys = "shippingIdKey";
const fromHomePageKey = "fromHomePage";
const productIdKey = "productId";
const productNameKey = "productName";
const categoryNameKey = "categoryName";
const categoryIdKey = "categoryId";
const variantIdKey = "variantId";
const idKey = "id";
const categoriesBlocKey = "categoriesBloc";
const subcategoryNameKey = "subcategoryName";
const isFromCartForLoginKey = "isFromCartForLogin";
const isFromCartForSignupKey = "isFromCartForSignup";
const pageIdKey = "pageId";
const titleKey = "title";
const shippingMethodRequestKey = "shippingMethodRequest";
const productIdKeys = "productId";
const productNameKeys = "productName";
const thumbnailKey = "thumbnail";
const fromBannerKey = "fromBannerKey";
const shippingModel="shippingModel";
const shippingId="shippingIds";


//===============================================================//


Map<String, dynamic> getCatalogMap(
     String categoryId, String variantId, String categoryName, bool fromHomepage,{bool fromBanner = false}) {
  Map<String, dynamic> args = {};
  args[categoryIdKey] = categoryId;
  args[variantIdKey] = variantId;
  args[categoryNameKey] = categoryName;
  args[fromHomePageKey] = fromHomepage;
  args[fromBannerKey] = fromBanner;
  return args;
}

Map<String, dynamic> subCategoryDataMap(
    String? id,
    String categoryName,
    // CategoryScreenBloc? categoriesBloc,

    ) {
  Map<String, dynamic> args = {};
  args[idKey] = id;
  args[subcategoryNameKey] = categoryName;
  // args[categoriesBlocKey] = categoriesBloc;
  return args;
}

Map<String, dynamic> getProductDataMap(String productName, String productId) {
  Map<String, dynamic> args = {};
  args[productNameKey] = productName;
  args[productIdKey] = productId;
  return args;
}



Map<String, dynamic> getReviewDataMap(
     int? productId,
     String? productName,
     String? thumbnail,
     ){
  Map<String, dynamic> args = {};
  args[productIdKeys] = productId;
  args[productNameKeys] = productName;
  args[thumbnailKey] = thumbnail;
  return args;
}
Map<String , dynamic> getSigninSignupMap(
bool isFromCartForLogin, bool isFromCartForSignup){
  Map<String, dynamic> args = {};
  args[isFromCartForLoginKey] = isFromCartForLogin;
  args[isFromCartForSignupKey] = isFromCartForSignup;
  return args;

}

Map<String , dynamic> getShippingMap(
    ShippingMethodModel? shippingMethodModel) {
  Map<String, dynamic> args = {};
  args[shippingModel] = shippingMethodModel;
  return args;
}
Map<String , dynamic> getCmsMap(
    String pageId, String title){
    Map<String, dynamic> args = {};
    args[pageIdKey] = pageId;
    args[titleKey] = title;
  return args;


}

Map<String , dynamic> getPaymentPageMap(List<String> shippingIds){
  Map<String, dynamic> args = {};
  args[shippingId] = shippingIds;
  return args;


}




