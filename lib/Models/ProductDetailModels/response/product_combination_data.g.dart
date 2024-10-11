// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_combination_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCombinationData _$ProductCombinationDataFromJson(
        Map<String, dynamic> json) =>
    ProductCombinationData(
      configuredId: json['configured_id'] as String?,
      additionalImages: (json['additional_images'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainPairImage: json['main_pair'] == null
          ? null
          : ProductImage.fromJson(json['main_pair'] as Map<String, dynamic>),
      quantityAvailable: json['amount'] as String?,
      productCode: json['product_code'] as String?,
      optionsCombinationList: (json['variation_options'] as List<dynamic>?)
          ?.map((e) =>
              CombinationOptionVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCombinationDataToJson(
        ProductCombinationData instance) =>
    <String, dynamic>{
      'configured_id': instance.configuredId,
      'product_code': instance.productCode,
      'amount': instance.quantityAvailable,
      'main_pair': instance.mainPairImage,
      'additional_images': instance.additionalImages,
      'variation_options': instance.optionsCombinationList,
    };
