import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/price_format.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_features.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_options.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/required_products.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/selected_variation_features.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/sellerProductsDataModel.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/variation_features_variants_model.dart';

import '../../baseResponse/base_response.dart';
import 'comments.dart';
import 'discounts.dart';
import 'image.dart';
import 'product_group_feature.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel extends BaseResponse {
  @JsonKey(name: "product_id")
  int? productId;

  @JsonKey(name: "company_id")
  String? companyId;

  @JsonKey(name: "currency_symbol")
  String? currencySymbol;

  @JsonKey(name: "product_code")
  String? productCode;

  @JsonKey(name: "amount")
  String? amount;

  @JsonKey(name: "list_price")
  double? listPrice;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "formatprice")
  dynamic formatprice;

  @JsonKey(name: "formatlist_price")
  dynamic formatlistPrice;

  @JsonKey(name: "is_discount")
  bool? isDiscount;

  @JsonKey(name: "discount")
  double? discount;

  @JsonKey(name: "product_type")
  String? productType;

  @JsonKey(name: "is_returnable")
  String? isReturnable;

  @JsonKey(name: "return_period")
  String? returnPeriod;

  @JsonKey(name: "min_qty")
  String? minQty;

  @JsonKey(name: "max_qty")
  String? maxQty;

  @JsonKey(name: "qty_step")
  String? qtyStep;

  @JsonKey(name: "tracking")
  String? tracking;

  @JsonKey(name: "tax_ids")
  List<String>? taxIds;

  @JsonKey(name: "product")
  String? product;

  @JsonKey(name: "short_description")
  String? shortDescription;

  @JsonKey(name: "full_description")
  String? fullDescription;

  @JsonKey(name: "promo_text")
  String? promoText;

  @JsonKey(name: "free_shipping")
  String? freeShipping;

  @JsonKey(name: "product_in_wishlist")
  bool? productInWishList;

  @JsonKey(name: "allow_add_to_cart")
  bool? allowAddToCart;

  @JsonKey(name: "allow_add_to_cart_message")
  String? allowAddToCartMessage;

  @JsonKey(name: "zero_price_action")
  String? zeroPriceAction;

  @JsonKey(name: "price_in_points")
  int? priceInPoints;

  @JsonKey(name: "main_pair")
  ProductImage? mainPair;

  @JsonKey(name: "additional_images")
  List<ProductImage>? additionalImages;

  @JsonKey(name: "has_options")
  bool? hasOptions;

  @JsonKey(name:"product_options")
  ProductOptions? productOptions;

  @JsonKey(name: "product_features")
  List<ProductFeatures>? productFeatures;

  @JsonKey(name: "productUrl")
  String? productUrl;

  @JsonKey(name: "discounts")
  Discounts? discounts;

  @JsonKey(name: "have_required")
  String? haveRequired;

  @JsonKey(name: "required_products")
  List<RequiredProducts>? requiredProducts;

  @JsonKey(name: "tags")
  List<dynamic>? tags;

  @JsonKey(name: "in_stock")
  bool? inStock;

  @JsonKey(name: "selected_variation_features")
  List<SelectedVariationFeatures>? selectedVariationFeatures;

  @JsonKey(name: "variation_features_variants")
  List<VariationFeaturesVariantsModel>? featuresVariantsArrayList;

  @JsonKey(name: "priceFormat")
  PriceFormat? priceFormat;

  @JsonKey(name: "reviews")
  bool? reviews;

  @JsonKey(name: "comments")
  Comments? comments;

  @JsonKey(name: "vendor_rating")
  String? vendorRating;

  @JsonKey(name: "cod_check")
  int? codCheck;

  @JsonKey(name: "product_comparison")
  bool? productComparison;

  @JsonKey(name: "contact_vendor")
  bool? contactVendor;

  @JsonKey(name: "product_features_group")
  List<ProductGroupFeatures>? productFeaturesGroup;

  @JsonKey(name: "item_id")
  Object? itemId;

  @JsonKey(name: "arAndroid")
  String? arAndroid;

  @JsonKey(name: "arIos")
  String? arIos;

  @JsonKey(name: "isAr")
  bool? isAr;

  @JsonKey(name: "seller_of_product")
  List<SellerProductsDataModel>? sellerProductsDataModel;

  @JsonKey(name: "reward_points")
  int? rewardPoints;

  ProductDetailModel(
      this.productId,
      this.companyId,
      this.currencySymbol,
      this.productCode,
      this.amount,
      this.listPrice,
      this.price,
      this.formatprice,
      this.formatlistPrice,
      this.isDiscount,
      this.discount,
      this.productType,
      this.isReturnable,
      this.returnPeriod,
      this.minQty,
      this.maxQty,
      this.qtyStep,
      this.tracking,
      this.taxIds,
      this.product,
      this.shortDescription,
      this.fullDescription,
      this.promoText,
      this.freeShipping,
      this.productInWishList,
      this.allowAddToCart,
      this.zeroPriceAction,
      this.priceInPoints,
      this.mainPair,
      this.additionalImages,
      this.hasOptions,
      this.productOptions,
      this.productFeatures,
      this.productUrl,
      this.discounts,
      this.haveRequired,
      this.requiredProducts,
      this.tags,
      this.inStock,
      this.featuresVariantsArrayList,
      this.priceFormat,
      this.reviews,
      this.comments,
      this.vendorRating,
      this.codCheck,
      this.productComparison,
      this.contactVendor,
      this.productFeaturesGroup,
      this.selectedVariationFeatures,
      this.itemId,
      this.arAndroid,
      this.arIos,
      this.isAr,
      this.allowAddToCartMessage,
      this.sellerProductsDataModel,
      this.rewardPoints
      );

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);
}
