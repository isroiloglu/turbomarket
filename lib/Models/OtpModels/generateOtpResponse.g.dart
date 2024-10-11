// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generateOtpResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateOtpResponse _$GenerateOtpResponseFromJson(Map<String, dynamic> json) =>
    GenerateOtpResponse(
      expireTime: json['expire_time'] as String?,
      otp: json['otp'] as String?,
      sms: json['sms_response'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..error = json['error']
      ..msg = json['msg'] as String?;

Map<String, dynamic> _$GenerateOtpResponseToJson(
        GenerateOtpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
      'msg': instance.msg,
      'sms_response': instance.sms,
      'otp': instance.otp,
      'expire_time': instance.expireTime,
    };
