// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveLanguages _$ActiveLanguagesFromJson(Map<String, dynamic> json) =>
    ActiveLanguages(
      json['lang_id'] as String?,
      json['lang_code'] as String?,
      json['name'] as String?,
      json['country_code'] as String?,
      json['direction'] as String?,
    );

Map<String, dynamic> _$ActiveLanguagesToJson(ActiveLanguages instance) =>
    <String, dynamic>{
      'lang_id': instance.langId,
      'lang_code': instance.langCode,
      'name': instance.name,
      'country_code': instance.countryCode,
      'direction': instance.direction,
    };
