// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_group_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductGroupFeatures _$ProductGroupFeaturesFromJson(
        Map<String, dynamic> json) =>
    ProductGroupFeatures(
      description: json['description'] as String?,
      name: json['name'] as String?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => FeatureValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      featureType: json['feature_type'] as String?,
    );

Map<String, dynamic> _$ProductGroupFeaturesToJson(
        ProductGroupFeatures instance) =>
    <String, dynamic>{
      'name': instance.name,
      'feature_type': instance.featureType,
      'values': instance.values,
      'description': instance.description,
    };
