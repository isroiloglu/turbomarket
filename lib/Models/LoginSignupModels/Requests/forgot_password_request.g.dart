// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordRequest(
      email: json['email'] as String?,
      forgotPassword: json['forget_password'] as bool?,
      languageCode: json['lang_code'] as String?,
      currencyCode: json['currency_code'] as String?,
      storefrontId: json['storefront_id'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordRequestToJson(
        ForgotPasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'forget_password': instance.forgotPassword,
      'lang_code': instance.languageCode,
      'currency_code': instance.currencyCode,
      'storefront_id': instance.storefrontId,
    };
