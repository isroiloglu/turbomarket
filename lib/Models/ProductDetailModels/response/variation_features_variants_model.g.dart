// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variation_features_variants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariationFeaturesVariantsModel _$VariationFeaturesVariantsModelFromJson(
        Map<String, dynamic> json) =>
    VariationFeaturesVariantsModel(
      purpose: json['purpose'] as String?,
      variant: json['variant'] as String?,
      variantId: json['variant_id'] as String?,
      featureId: json['feature_id'] as String?,
      description: json['description'] as String?,
      displayOnCatalog: json['display_on_catalog'] as String?,
      featureStyle: json['feature_style'] as String?,
      featureVariantsList: (json['variants'] as List<dynamic>?)
          ?.map((e) => FeatureVariantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
      purposePosition: json['purpose_position'] as String?,
      variantPosition: json['variant_position'] as String?,
    )..internalName = json['internal_name'] as String?;

Map<String, dynamic> _$VariationFeaturesVariantsModelToJson(
        VariationFeaturesVariantsModel instance) =>
    <String, dynamic>{
      'feature_id': instance.featureId,
      'feature_style': instance.featureStyle,
      'description': instance.description,
      'position': instance.position,
      'purpose': instance.purpose,
      'display_on_catalog': instance.displayOnCatalog,
      'purpose_position': instance.purposePosition,
      'variant': instance.variant,
      'variant_id': instance.variantId,
      'variant_position': instance.variantPosition,
      'internal_name': instance.internalName,
      'variants': instance.featureVariantsList,
    };
