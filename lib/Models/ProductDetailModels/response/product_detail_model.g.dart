// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      json['product_id'] as int?,
      json['company_id'] as String?,
      json['currency_symbol'] as String?,
      json['product_code'] as String?,
      json['amount'] as String?,
      (json['list_price'] as num?)?.toDouble(),
      (json['price'] as num?)?.toDouble(),
      json['formatprice'],
      json['formatlist_price'],
      json['is_discount'] as bool?,
      (json['discount'] as num?)?.toDouble(),
      json['product_type'] as String?,
      json['is_returnable'] as String?,
      json['return_period'] as String?,
      json['min_qty'] as String?,
      json['max_qty'] as String?,
      json['qty_step'] as String?,
      json['tracking'] as String?,
      (json['tax_ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['product'] as String?,
      json['short_description'] as String?,
      json['full_description'] as String?,
      json['promo_text'] as String?,
      json['free_shipping'] as String?,
      json['product_in_wishlist'] as bool?,
      json['allow_add_to_cart'] as bool?,
      json['zero_price_action'] as String?,
      json['price_in_points'] as int?,
      json['main_pair'] == null
          ? null
          : ProductImage.fromJson(json['main_pair'] as Map<String, dynamic>),
      (json['additional_images'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['has_options'] as bool?,
      json['product_options'] == null
          ? null
          : ProductOptions.fromJson(
              json['product_options'] as Map<String, dynamic>),
      (json['product_features'] as List<dynamic>?)
          ?.map((e) => ProductFeatures.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['productUrl'] as String?,
      json['discounts'] == null
          ? null
          : Discounts.fromJson(json['discounts'] as Map<String, dynamic>),
      json['have_required'] as String?,
      (json['required_products'] as List<dynamic>?)
          ?.map((e) => RequiredProducts.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['tags'] as List<dynamic>?,
      json['in_stock'] as bool?,
      (json['variation_features_variants'] as List<dynamic>?)
          ?.map((e) => VariationFeaturesVariantsModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['priceFormat'] == null
          ? null
          : PriceFormat.fromJson(json['priceFormat'] as Map<String, dynamic>),
      json['reviews'] as bool?,
      json['comments'] == null
          ? null
          : Comments.fromJson(json['comments'] as Map<String, dynamic>),
      json['vendor_rating'] as String?,
      json['cod_check'] as int?,
      json['product_comparison'] as bool?,
      json['contact_vendor'] as bool?,
      (json['product_features_group'] as List<dynamic>?)
          ?.map((e) => ProductGroupFeatures.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['selected_variation_features'] as List<dynamic>?)
          ?.map((e) =>
              SelectedVariationFeatures.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['item_id'],
      json['arAndroid'] as String?,
      json['arIos'] as String?,
      json['isAr'] as bool?,
      json['allow_add_to_cart_message'] as String?,
      (json['seller_of_product'] as List<dynamic>?)
          ?.map((e) =>
              SellerProductsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['reward_points'] as int?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..error = json['error']
      ..msg = json['msg'] as String?;

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
      'msg': instance.msg,
      'product_id': instance.productId,
      'company_id': instance.companyId,
      'currency_symbol': instance.currencySymbol,
      'product_code': instance.productCode,
      'amount': instance.amount,
      'list_price': instance.listPrice,
      'price': instance.price,
      'formatprice': instance.formatprice,
      'formatlist_price': instance.formatlistPrice,
      'is_discount': instance.isDiscount,
      'discount': instance.discount,
      'product_type': instance.productType,
      'is_returnable': instance.isReturnable,
      'return_period': instance.returnPeriod,
      'min_qty': instance.minQty,
      'max_qty': instance.maxQty,
      'qty_step': instance.qtyStep,
      'tracking': instance.tracking,
      'tax_ids': instance.taxIds,
      'product': instance.product,
      'short_description': instance.shortDescription,
      'full_description': instance.fullDescription,
      'promo_text': instance.promoText,
      'free_shipping': instance.freeShipping,
      'product_in_wishlist': instance.productInWishList,
      'allow_add_to_cart': instance.allowAddToCart,
      'allow_add_to_cart_message': instance.allowAddToCartMessage,
      'zero_price_action': instance.zeroPriceAction,
      'price_in_points': instance.priceInPoints,
      'main_pair': instance.mainPair,
      'additional_images': instance.additionalImages,
      'has_options': instance.hasOptions,
      'product_options': instance.productOptions,
      'product_features': instance.productFeatures,
      'productUrl': instance.productUrl,
      'discounts': instance.discounts,
      'have_required': instance.haveRequired,
      'required_products': instance.requiredProducts,
      'tags': instance.tags,
      'in_stock': instance.inStock,
      'selected_variation_features': instance.selectedVariationFeatures,
      'variation_features_variants': instance.featuresVariantsArrayList,
      'priceFormat': instance.priceFormat,
      'reviews': instance.reviews,
      'comments': instance.comments,
      'vendor_rating': instance.vendorRating,
      'cod_check': instance.codCheck,
      'product_comparison': instance.productComparison,
      'contact_vendor': instance.contactVendor,
      'product_features_group': instance.productFeaturesGroup,
      'item_id': instance.itemId,
      'arAndroid': instance.arAndroid,
      'arIos': instance.arIos,
      'isAr': instance.isAr,
      'seller_of_product': instance.sellerProductsDataModel,
      'reward_points': instance.rewardPoints,
    };
