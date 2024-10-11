// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureVariantModel _$FeatureVariantModelFromJson(Map<String, dynamic> json) =>
    FeatureVariantModel(
      featureId: json['feature_id'] as String?,
      productId: json['product_id'] as String?,
      variantId: json['variant_id'] as String?,
      imagePath: json['image_path'] as String?,
      variant: json['variant'] as String?,
      purpose: json['purpose'] as String?,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$FeatureVariantModelToJson(
        FeatureVariantModel instance) =>
    <String, dynamic>{
      'feature_id': instance.featureId,
      'purpose': instance.purpose,
      'variant': instance.variant,
      'variant_id': instance.variantId,
      'product_id': instance.productId,
      'image_path': instance.imagePath,
      'isSelected': instance.isSelected,
    };
