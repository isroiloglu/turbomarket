// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeCategoryProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCategoryProduct _$HomeCategoryProductFromJson(Map<String, dynamic> json) =>
    HomeCategoryProduct(
      json['category_id'] as String?,
      json['title'] as String?,
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeCategoryProductToJson(
        HomeCategoryProduct instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'title': instance.title,
      'products': instance.products,
    };
