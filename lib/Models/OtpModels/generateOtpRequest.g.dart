// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generateOtpRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateOtpRequest _$GenerateOtpRequestFromJson(Map<String, dynamic> json) =>
    GenerateOtpRequest(
      phone: json['phone'] as String?,
      action: json['action'] as String?,
      currencyCode: json['currency_code'] as String?,
      lang: json['lang_code'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$GenerateOtpRequestToJson(GenerateOtpRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'action': instance.action,
      'lang_code': instance.lang,
      'currency_code': instance.currencyCode,
      'otp': instance.otp,
    };
