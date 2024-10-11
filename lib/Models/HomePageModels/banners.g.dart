// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
      json['image_path'] as String?,
      json['name'] as String?,
      json['type'] as String?,
      json['id'] as String?,
    );

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'image_path': instance.imagePath,
      'name': instance.name,
      'type': instance.type,
      'id': instance.id,
    };
