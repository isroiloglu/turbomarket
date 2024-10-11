// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryList _$CountryListFromJson(Map<String, dynamic> json) => CountryList(
      countryCode: json['country_code'] as String?,
      countryName: json['country_name'] as String?,
      stateList: (json['state_list'] as List<dynamic>)
          .map((e) => StateList.fromJson(e as Map<String, dynamic>))
          .toList(),
      coutryCode: json['coutry_code'] as String?,
    );

Map<String, dynamic> _$CountryListToJson(CountryList instance) =>
    <String, dynamic>{
      'country_code': instance.countryCode,
      'country_name': instance.countryName,
      'state_list': instance.stateList,
      'coutry_code': instance.coutryCode,
    };
