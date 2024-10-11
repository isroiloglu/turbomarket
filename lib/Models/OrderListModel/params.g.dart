// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderParams _$OrderParamsFromJson(Map<String, dynamic> json) => OrderParams(
      json['page'],
      json['items_per_page'] as int?,
      json['user_id'] as String?,
      json['lang_code'] as String?,
      json['currency_code'] as String?,
      json['include_incompleted'] as bool?,
      json['sort_order'] as String?,
      json['sort_by'] as String?,
      json['sort_order_rev'] as String?,
      json['total_items'] as String?,
    );

Map<String, dynamic> _$OrderParamsToJson(OrderParams instance) =>
    <String, dynamic>{
      'page': instance.page,
      'items_per_page': instance.itemsPerPage,
      'user_id': instance.userId,
      'lang_code': instance.langCode,
      'currency_code': instance.currencyCode,
      'include_incompleted': instance.includeIncompleted,
      'sort_order': instance.sortOrder,
      'sort_by': instance.sortBy,
      'sort_order_rev': instance.sortOrderRev,
      'total_items': instance.totalItems,
    };
