// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxSummary _$TaxSummaryFromJson(Map<String, dynamic> json) => TaxSummary(
      json['included'],
      json['added'],
      json['total'],
    );

Map<String, dynamic> _$TaxSummaryToJson(TaxSummary instance) =>
    <String, dynamic>{
      'included': instance.included,
      'added': instance.added,
      'total': instance.total,
    };
