// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detailed _$DetailedFromJson(Map<String, dynamic> json) => Detailed(
      objectId: json['object_id'] as String?,
      objectType: json['object_type'] as String?,
      type: json['type'] as String?,
      imagePath: json['image_path'] as String?,
      alt: json['alt'] as String?,
      imageX: json['image_x'] as String?,
      imageY: json['image_y'] as String?,
      httpImagePath: json['http_image_path'] as String?,
      httpsImagePath: json['https_image_path'] as String?,
      absolutePath: json['absolute_path'] as String?,
      relativePath: json['relative_path'] as String?,
      isHighRes: json['is_high_res'] as bool?,
    );

Map<String, dynamic> _$DetailedToJson(Detailed instance) => <String, dynamic>{
      'object_id': instance.objectId,
      'object_type': instance.objectType,
      'type': instance.type,
      'image_path': instance.imagePath,
      'alt': instance.alt,
      'image_x': instance.imageX,
      'image_y': instance.imageY,
      'http_image_path': instance.httpImagePath,
      'https_image_path': instance.httpsImagePath,
      'absolute_path': instance.absolutePath,
      'relative_path': instance.relativePath,
      'is_high_res': instance.isHighRes,
    };
