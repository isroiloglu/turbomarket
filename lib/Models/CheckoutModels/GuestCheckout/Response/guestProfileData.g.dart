// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guestProfileData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestProfileData _$GuestProfileDataFromJson(Map<String, dynamic> json) =>
    GuestProfileData(
      (json['country_list'] as List<dynamic>?)
          ?.map((e) => CountryList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GuestProfileDataToJson(GuestProfileData instance) =>
    <String, dynamic>{
      'country_list': instance.countryList,
    };
