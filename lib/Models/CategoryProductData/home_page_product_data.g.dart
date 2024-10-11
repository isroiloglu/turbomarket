// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageProductData _$HomePageProductDataFromJson(Map<String, dynamic> json) =>
    HomePageProductData(
      json['title'] as String?,
      json['image'] as String?,
      json['id'] as String?,
      (json['product_list'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePageProductDataToJson(
        HomePageProductData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'id': instance.id,
      'product_list': instance.productList,
    };
