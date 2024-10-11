// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createProfileRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProfileRequest _$CreateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    CreateProfileRequest(
      json['lang_code'] as String?,
      json['user_data'] == null
          ? null
          : ProfileData.fromJson(json['user_data'] as Map<String, dynamic>),
      json['storefront_id'] as String?,
    );

Map<String, dynamic> _$CreateProfileRequestToJson(
        CreateProfileRequest instance) =>
    <String, dynamic>{
      'lang_code': instance.langCode,
      'user_data': instance.userData,
      'storefront_id': instance.storefrontId,
    };
