// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotions _$PromotionsFromJson(Map<String, dynamic> json) => Promotions(
      json['promotion_id'] as String?,
      json['company_id'] as String?,
      json['to_date'] as String?,
      json['from_date'] as String?,
      json['priority'] as String?,
      json['stop'] as String?,
      json['stop_other_rules'] as String?,
      json['zone'] as String?,
      json['conditions_hash'] as String?,
      json['status'] as String?,
      json['number_of_usages'] as String?,
      json['users_conditions_hash'] as String?,
      json['name'] as String?,
      json['detailed_description'] as String?,
      json['short_description'] as String?,
      json['promotion_image_id'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$PromotionsToJson(Promotions instance) =>
    <String, dynamic>{
      'promotion_id': instance.promotionId,
      'company_id': instance.companyId,
      'to_date': instance.toDate,
      'from_date': instance.fromDate,
      'priority': instance.priority,
      'stop': instance.stop,
      'stop_other_rules': instance.stopOtherRules,
      'zone': instance.zone,
      'conditions_hash': instance.conditionsHash,
      'status': instance.status,
      'number_of_usages': instance.numberOfUsages,
      'users_conditions_hash': instance.usersConditionsHash,
      'name': instance.name,
      'detailed_description': instance.detailedDescription,
      'short_description': instance.shortDescription,
      'promotion_image_id': instance.promotionImageId,
      'image': instance.image,
    };
