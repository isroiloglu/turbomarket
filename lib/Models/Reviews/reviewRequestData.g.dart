// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewRequestData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewRequestData _$ReviewRequestDataFromJson(Map<String, dynamic> json) =>
    ReviewRequestData(
      name: json['name'] as String?,
      message: json['message'] as String?,
      ratingValue: (json['rating_value'] as num?)?.toDouble(),
      customerId: json['user_id'] as String?,
      selectGdprAgreement: json['select_gdpr_agreement'] as String?,
    );

Map<String, dynamic> _$ReviewRequestDataToJson(ReviewRequestData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'rating_value': instance.ratingValue,
      'user_id': instance.customerId,
      'select_gdpr_agreement': instance.selectGdprAgreement,
    };
