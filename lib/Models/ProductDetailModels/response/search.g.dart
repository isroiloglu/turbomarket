// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      page: json['page'] as int?,
      threadId: json['thread_id'] as String?,
      availOnly: json['avail_only'] as bool?,
      random: json['random'] as bool?,
      itemsPerPage: json['items_per_page'] as int?,
      totalItems: json['total_items'] as String?,
      search: json['search'] == null
          ? null
          : Search.fromJson(json['search'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'page': instance.page,
      'thread_id': instance.threadId,
      'avail_only': instance.availOnly,
      'random': instance.random,
      'items_per_page': instance.itemsPerPage,
      'total_items': instance.totalItems,
      'search': instance.search,
    };
