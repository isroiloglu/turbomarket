// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['b_address'] as String,
      json['b_city'] as String,
      json['b_country'] as String,
      json['b_email'] as String,
      json['b_firstname'] as String,
      json['b_lastname'] as String,
      json['b_phone'] as String,
      json['b_state'] as String,
      json['b_zipcode'] as String,
      json['profile_name'] as String,
      json['ship_to_another'] as int,
      json['user_id'] as String,
      json['s_address'] as String,
      json['s_city'] as String,
      json['s_country'] as String,
      json['s_firstname'] as String,
      json['s_lastname'] as String,
      json['s_phone'] as String,
      json['s_state'] as String,
      json['s_zipcode'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'b_address': instance.bAddress,
      'b_city': instance.bCity,
      'b_country': instance.bCountry,
      'b_email': instance.bEmail,
      'b_firstname': instance.bFirstname,
      'b_lastname': instance.bLastname,
      'b_phone': instance.bPhone,
      'b_state': instance.bState,
      'b_zipcode': instance.bZipcode,
      'profile_name': instance.profileName,
      'ship_to_another': instance.shipToAnother,
      'user_id': instance.userId,
      's_address': instance.sAddress,
      's_city': instance.sCity,
      's_country': instance.sCountry,
      's_firstname': instance.sFirstname,
      's_lastname': instance.sLastname,
      's_phone': instance.sPhone,
      's_state': instance.sState,
      's_zipcode': instance.sZipcode,
    };
