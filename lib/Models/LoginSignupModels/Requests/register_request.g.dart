// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAccountRequest _$RegisterAccountRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterAccountRequest(
      email: json['email'] as String?,
      guestId: json['g_id'] as String?,
      password: json['password1'] as String?,
      confirmPassword: json['password2'] as String?,
      customerType: json['user_type'] as String?,
      companyId: json['company_id'] as String?,
      languageCode: json['lang_code'] as String?,
      currencyCode: json['currency_code'] as String?,
      chatToken: json['chat_token'] as String?,
      phone: json['phone'] as String?,
      storefrontId: json['storefront_id'] as String?,
    );

Map<String, dynamic> _$RegisterAccountRequestToJson(
        RegisterAccountRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'g_id': instance.guestId,
      'password1': instance.password,
      'password2': instance.confirmPassword,
      'user_type': instance.customerType,
      'company_id': instance.companyId,
      'lang_code': instance.languageCode,
      'currency_code': instance.currencyCode,
      'chat_token': instance.chatToken,
      'phone': instance.phone,
      'storefront_id': instance.storefrontId,
    };
