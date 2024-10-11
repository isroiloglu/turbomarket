// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainPair _$MainPairFromJson(Map<String, dynamic> json) => MainPair(
      pairId: json['pair_id'] as String?,
      imageId: json['image_id'] as String?,
      detailedId: json['detailed_id'] as String?,
      position: json['position'] as String?,
      objectId: json['object_id'] as String?,
      objectType: json['object_type'] as String?,
      detailed: json['detailed'] == null
          ? null
          : Detailed.fromJson(json['detailed'] as Map<String, dynamic>),
      main: json['main'] as String?,
      thumb: json['thumb'] as String?,
    );

Map<String, dynamic> _$MainPairToJson(MainPair instance) => <String, dynamic>{
      'pair_id': instance.pairId,
      'image_id': instance.imageId,
      'detailed_id': instance.detailedId,
      'position': instance.position,
      'object_id': instance.objectId,
      'object_type': instance.objectType,
      'detailed': instance.detailed,
      'main': instance.main,
      'thumb': instance.thumb,
    };
