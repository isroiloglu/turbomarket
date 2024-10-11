// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionResponse _$PromotionResponseFromJson(Map<String, dynamic> json) =>
    PromotionResponse(
      (json['promotions'] as List<dynamic>?)
          ?.map((e) => Promotions.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['search'] == null
          ? null
          : PromotionSearch.fromJson(json['search'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PromotionResponseToJson(PromotionResponse instance) =>
    <String, dynamic>{
      'promotions': instance.promotions,
      'search': instance.search,
    };
