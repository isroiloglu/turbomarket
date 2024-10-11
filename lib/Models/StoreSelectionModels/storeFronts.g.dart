// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeFronts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreFront _$StoreFrontFromJson(Map<String, dynamic> json) => StoreFront(
      json['storefront_id'] as String?,
      json['url'] as String?,
      json['name'] as String?,
      json['is_default'] as String?,
    );

Map<String, dynamic> _$StoreFrontToJson(StoreFront instance) =>
    <String, dynamic>{
      'storefront_id': instance.storefrontId,
      'url': instance.url,
      'name': instance.name,
      'is_default': instance.isDefault,
    };
