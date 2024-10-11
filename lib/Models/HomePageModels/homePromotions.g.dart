// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homePromotions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotions _$PromotionsFromJson(Map<String, dynamic> json) => Promotions(
      json['promotion_id'] as String?,
      json['image'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$PromotionsToJson(Promotions instance) =>
    <String, dynamic>{
      'promotion_id': instance.promotionId,
      'image': instance.image,
      'name': instance.name,
    };
