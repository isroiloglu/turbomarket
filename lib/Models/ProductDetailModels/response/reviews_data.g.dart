// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsData _$ReviewsDataFromJson(Map<String, dynamic> json) => ReviewsData(
      reviews: json['reviews'] as bool?,
      comments: json['comments'] == null
          ? null
          : Comments.fromJson(json['comments'] as Map<String, dynamic>),
      gdpr: json['gdpr'] == null
          ? null
          : GDPR.fromJson(json['gdpr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewsDataToJson(ReviewsData instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
      'comments': instance.comments,
      'gdpr': instance.gdpr,
    };
