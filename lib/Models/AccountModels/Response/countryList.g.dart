// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countryList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryList _$CountryListFromJson(Map<String, dynamic> json) => CountryList(
      json['country_code'] as String?,
      json['country_name'] as String?,
      (json['state_list'] as List<dynamic>?)
          ?.map((e) => StateData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryListToJson(CountryList instance) =>
    <String, dynamic>{
      'country_code': instance.countryCode,
      'country_name': instance.countryName,
      'state_list': instance.stateList,
    };
