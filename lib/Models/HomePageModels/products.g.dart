// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      json['title'] as String?,
      json['image'] as String?,
      json['id'] as String?,
      (json['product_list'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..dcCode = json['dc_code'] as String?
      ..imageVisible = json['image_visible'] as bool?
      ..type = json['type'] as String?
      ..countries = (json['countries'] as List<dynamic>?)
          ?.map((e) => Countries.fromJson(e as Map<String, dynamic>))
          .toList()
      ..pages = (json['pages'] as List<dynamic>?)
          ?.map((e) => BannerPages.fromJson(e as Map<String, dynamic>))
          .toList()
      ..products = (json['products'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..categories = (json['categories'] as List<dynamic>?)
          ?.map((e) => HomeCategoryProduct.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'id': instance.id,
      'dc_code': instance.dcCode,
      'image_visible': instance.imageVisible,
      'type': instance.type,
      'product_list': instance.productList,
      'countries': instance.countries,
      'pages': instance.pages,
      'products': instance.products,
      'categories': instance.categories,
    };
