// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestionModel _$SearchSuggestionModelFromJson(
        Map<String, dynamic> json) =>
    SearchSuggestionModel(
      (json['search_data'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['filters'] as List<dynamic>?)
          ?.map((e) => Filters.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..filter = (json['filter'] as List<dynamic>?)
        ?.map((e) => Filters.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$SearchSuggestionModelToJson(
        SearchSuggestionModel instance) =>
    <String, dynamic>{
      'search_data': instance.searchData,
      'filter': instance.filter,
      'filters': instance.filterList,
    };
