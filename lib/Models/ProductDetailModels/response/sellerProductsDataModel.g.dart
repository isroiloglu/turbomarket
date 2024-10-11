// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sellerProductsDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerProductsDataModel _$SellerProductsDataModelFromJson(
        Map<String, dynamic> json) =>
    SellerProductsDataModel(
      productId: json['product_id'] as int?,
      companyId: json['company_id'] as String?,
      company: json['company'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      formatPrice: json['formatprice'] as String?,
      amount: json['amount'] as String?,
      allowAddToCart: json['allow_add_to_cart'] as bool?,
      logo: json['logo'] as String?,
      outOfStock: json[''] as bool?,
      backOrder: json['backOrder'] as bool?,
      inStock: json['in_stock'] as bool?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..error = json['error']
      ..msg = json['msg'] as String?;

Map<String, dynamic> _$SellerProductsDataModelToJson(
        SellerProductsDataModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
      'msg': instance.msg,
      'product_id': instance.productId,
      'company_id': instance.companyId,
      'company': instance.company,
      'city': instance.city,
      'country': instance.country,
      'price': instance.price,
      'formatprice': instance.formatPrice,
      'amount': instance.amount,
      'allow_add_to_cart': instance.allowAddToCart,
      'logo': instance.logo,
      'in_stock': instance.inStock,
      'backOrder': instance.backOrder,
      '': instance.outOfStock,
    };
