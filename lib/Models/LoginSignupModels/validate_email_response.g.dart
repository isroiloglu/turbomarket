// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateEmailResponse _$ValidateEmailResponseFromJson(
        Map<String, dynamic> json) =>
    ValidateEmailResponse(
      json['success'] as bool,
      json['message'] as String,
    );

Map<String, dynamic> _$ValidateEmailResponseToJson(
        ValidateEmailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
