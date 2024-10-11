// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      variantId: json['variant_id'] as String?,
      optionId: json['option_id'],
      position: json['position'] as String?,
      modifier: json['modifier'],
      modifierType: json['modifier_type'] as String?,
      weightModifier: json['weight_modifier'] as String?,
      weightModifierType: json['weight_modifier_type'] as String?,
      pointModifier: json['point_modifier'] as String?,
      pointModifierType: json['point_modifier_type'] as String?,
      variantName: json['variant_name'] as String?,
      imagePath: json['image_path'] as String?,
      formatModifier: json['format_modifier'] as String?,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'variant_id': instance.variantId,
      'option_id': instance.optionId,
      'position': instance.position,
      'modifier': instance.modifier,
      'modifier_type': instance.modifierType,
      'weight_modifier': instance.weightModifier,
      'weight_modifier_type': instance.weightModifierType,
      'point_modifier': instance.pointModifier,
      'point_modifier_type': instance.pointModifierType,
      'variant_name': instance.variantName,
      'image_path': instance.imagePath,
      'format_modifier': instance.formatModifier,
    };
