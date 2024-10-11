// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveCurrency _$ActiveCurrencyFromJson(Map<String, dynamic> json) =>
    ActiveCurrency(
      json['currency_id'] as String?,
      json['currency_code'] as String?,
      json['symbol'] as String?,
      json['description'] as String?,
      json['status'] as String?,
      json['decimals'] as String?,
    );

Map<String, dynamic> _$ActiveCurrencyToJson(ActiveCurrency instance) =>
    <String, dynamic>{
      'currency_id': instance.currencyId,
      'currency_code': instance.currencyCode,
      'symbol': instance.symbol,
      'description': instance.description,
      'status': instance.status,
      'decimals': instance.decimals,
    };
