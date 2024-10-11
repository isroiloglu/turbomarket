// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdpr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDPR _$GDPRFromJson(Map<String, dynamic> json) => GDPR(
      fullAgreement: json['full_agreement'] as String?,
      shortAgreement: json['short_agreement'] as String?,
    );

Map<String, dynamic> _$GDPRToJson(GDPR instance) => <String, dynamic>{
      'short_agreement': instance.shortAgreement,
      'full_agreement': instance.fullAgreement,
    };
