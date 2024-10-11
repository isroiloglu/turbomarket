// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialLoginRequest _$SocialLoginRequestFromJson(Map<String, dynamic> json) =>
    SocialLoginRequest(
      companyId: json['company_id'] as String?,
      firstName: json['firstname'] as String?,
      lastName: json['lastname'] as String?,
      email: json['email'] as String?,
      guestId: json['g_id'] as String?,
      languageCode: json['lang_code'] as String?,
      currencyCode: json['currency_code'] as String?,
      chatToken: json['chat_token'] as String?,
      storefrontId: json['storefront_id'] as String?,
    );

Map<String, dynamic> _$SocialLoginRequestToJson(SocialLoginRequest instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'firstname': instance.firstName,
      'lastname': instance.lastName,
      'email': instance.email,
      'g_id': instance.guestId,
      'lang_code': instance.languageCode,
      'currency_code': instance.currencyCode,
      'chat_token': instance.chatToken,
      'storefront_id': instance.storefrontId,
    };
