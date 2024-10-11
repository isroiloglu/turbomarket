// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
      json['b_address'] as String?,
      json['s_state'] as String?,
      json['s_phone'] as String?,
      json['s_lastname'] as String?,
      json['s_firstname'] as String?,
      json['s_country'] as String?,
      json['s_city'] as String?,
      json['s_Address'] as String?,
      json['profile_name'] as String?,
      json['profile_mailing_list_1'] as bool?,
      json['b_zipcode'] as String?,
      json['b_state'] as String?,
      json['b_phone'] as String?,
      json['b_lastname'] as String?,
      json['b_firstname'] as String?,
      json['b_city'] as String?,
      json['b_country'] as String?,
      json['s_zipcode'] as String?,
      json['ship_to_another'] as int?,
      json['user_id'] as String?,
      json['b_email'] as String? ?? '',
    );

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'b_address': instance.bAddress,
      's_state': instance.sState,
      's_phone': instance.sPhone,
      's_lastname': instance.sLastname,
      's_firstname': instance.sFirstname,
      's_country': instance.sCountry,
      's_city': instance.sCity,
      's_Address': instance.sAddress,
      'profile_name': instance.profileName,
      'profile_mailing_list_1': instance.profileMailingLis1,
      'b_zipcode': instance.bZipcode,
      'b_state': instance.bState,
      'b_phone': instance.bPhone,
      'b_lastname': instance.bLastname,
      'b_firstname': instance.bFirstname,
      'b_city': instance.bCity,
      'b_country': instance.bCountry,
      's_zipcode': instance.sZipcode,
      'ship_to_another': instance.shipToAnother,
      'user_id': instance.userId,
      'b_email': instance.bEmail,
    };
