// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_taxes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderTaxes _$OrderTaxesFromJson(Map<String, dynamic> json) => OrderTaxes(
      json['index'] as String?,
      (json['value'] as num?)?.toDouble(),
      json['formatvalue'] as String?,
    );

Map<String, dynamic> _$OrderTaxesToJson(OrderTaxes instance) =>
    <String, dynamic>{
      'index': instance.index,
      'value': instance.value,
      'formatvalue': instance.formatValue,
    };
