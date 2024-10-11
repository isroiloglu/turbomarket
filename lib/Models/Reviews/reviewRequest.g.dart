// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitReviewRequest _$SubmitReviewRequestFromJson(Map<String, dynamic> json) =>
    SubmitReviewRequest(
      reviewData: json['review_data'] == null
          ? null
          : ReviewRequestData.fromJson(
              json['review_data'] as Map<String, dynamic>),
      languageCode: json['lang_code'] as String?,
      storefrontId: json['storefront_id'] as String?,
    );

Map<String, dynamic> _$SubmitReviewRequestToJson(
        SubmitReviewRequest instance) =>
    <String, dynamic>{
      'review_data': instance.reviewData,
      'lang_code': instance.languageCode,
      'storefront_id': instance.storefrontId,
    };
