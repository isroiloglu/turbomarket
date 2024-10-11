// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductOption _$CartProductOptionFromJson(Map<String, dynamic> json) =>
    CartProductOption(
      optionId: json['option_id'] as int?,
      optionValue: json['option_value'] as String?,
      variantId: json['variant_id'],
      variantValue: json['variant_value'] as String?,
    );

Map<String, dynamic> _$CartProductOptionToJson(CartProductOption instance) =>
    <String, dynamic>{
      'option_id': instance.optionId,
      'option_value': instance.optionValue,
      'variant_id': instance.variantId,
      'variant_value': instance.variantValue,
    };
