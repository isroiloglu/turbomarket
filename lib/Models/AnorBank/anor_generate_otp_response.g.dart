// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anor_generate_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnorGenerateOtpResponse _$AnorGenerateOtpResponseFromJson(
        Map<String, dynamic> json) =>
    AnorGenerateOtpResponse(
      cardId: json['card_id'],
      refreshToken: json['refresh_token'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..error = json['error']
      ..msg = json['msg'] as String?;

Map<String, dynamic> _$AnorGenerateOtpResponseToJson(
        AnorGenerateOtpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
      'msg': instance.msg,
      'card_id': instance.cardId,
      'refresh_token': instance.refreshToken,
    };
