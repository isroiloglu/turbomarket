// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Countries _$CountriesFromJson(Map<String, dynamic> json) => Countries(
      json['dc_code'] as String?,
      json['id'] as String?,
      json['image'] as String?,
      json['title'] as String?,
    );

Map<String, dynamic> _$CountriesToJson(Countries instance) => <String, dynamic>{
      'dc_code': instance.dcCode,
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
    };
