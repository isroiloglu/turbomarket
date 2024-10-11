// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateProfileRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequest(
      json['b_address'] as String?,
      json['profile_id'] as String?,
      json['password1'] as String?,
      json['lang_code'] as String?,
      json['email'] as String?,
      json['password2'] as String?,
      json['company_id'] as String?,
      json['s_state'] as String?,
      json['s_phone'] as String?,
      json['s_lastname'] as String?,
      json['s_firstname'] as String?,
      json['s_city'] as String?,
      json['s_country'] as String?,
      json['b_state'] as String?,
      json['b_phone'] as String?,
      json['b_lastname'] as String?,
      json['b_firstname'] as String?,
      json['b_city'] as String?,
      json['b_country'] as String?,
      json['profile_name'] as String?,
      json['select_gdpr_agreement'] as String?,
      json['ship_to_another'] as int?,
      json['user_id'] as String?,
      json['user_type'] as String?,
      json['phone'] as String?,
      json['b_zipcode'] as String?,
      json['s_zipcode'] as String?,
      json['s_address'] as String?,
      json['storefront_id'] as String?,
    );

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'b_address': instance.bAddress,
      'profile_id': instance.profileId,
      'password1': instance.password1,
      'lang_code': instance.langCode,
      'email': instance.email,
      'password2': instance.password2,
      'company_id': instance.companyId,
      's_state': instance.sState,
      's_phone': instance.sPhone,
      's_lastname': instance.sLastName,
      's_firstname': instance.sFirstName,
      's_city': instance.sCity,
      's_country': instance.sCountry,
      'b_state': instance.bState,
      'b_phone': instance.bPhone,
      'b_lastname': instance.bLastname,
      'b_firstname': instance.bFirstname,
      'b_city': instance.bCity,
      'b_country': instance.bCountry,
      'profile_name': instance.profileName,
      'select_gdpr_agreement': instance.selectGdprAgreement,
      'ship_to_another': instance.shipToAnother,
      'user_id': instance.userId,
      'user_type': instance.userType,
      'phone': instance.phone,
      'b_zipcode': instance.bZipcode,
      's_zipcode': instance.sZipcode,
      's_address': instance.sAddress,
      'storefront_id': instance.storefrontId,
    };
