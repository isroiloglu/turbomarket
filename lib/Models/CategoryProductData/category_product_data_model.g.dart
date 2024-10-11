// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductsDataModel _$CategoryProductsDataModelFromJson(
        Map<String, dynamic> json) =>
    CategoryProductsDataModel(
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sorting'] as List<dynamic>?)
          ?.map((e) => Sorting.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['filters'] as List<dynamic>?)
          ?.map((e) => Filters.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['params'] == null
          ? null
          : ProductParams.fromJson(json['params'] as Map<String, dynamic>),
      json['homepage_products'] == null
          ? null
          : HomePageProductData.fromJson(
              json['homepage_products'] as Map<String, dynamic>),
      json['product_count'] as int?,
      json['id'] as String?,
      json['name'] as String?,
      (json['promotion_products'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryProductsDataModelToJson(
        CategoryProductsDataModel instance) =>
    <String, dynamic>{
      'products': instance.productList,
      'promotion_products': instance.promotionProducts,
      'sorting': instance.sorting,
      'filters': instance.filters,
      'params': instance.productParams,
      'name': instance.name,
      'id': instance.id,
      'product_count': instance.productCount,
      'homepage_products': instance.homePageProductData,
    };
