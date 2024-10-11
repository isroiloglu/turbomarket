// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brands _$BrandsFromJson(Map<String, dynamic> json) => Brands(
      json['variant_id'] as String?,
      json['variant'] as String?,
      json['image_path'] as String?,
    );

Map<String, dynamic> _$BrandsToJson(Brands instance) => <String, dynamic>{
      'variant_id': instance.variantId,
      'variant': instance.variant,
      'image_path': instance.imagePath,
    };
