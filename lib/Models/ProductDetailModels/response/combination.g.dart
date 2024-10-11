// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Combination _$CombinationFromJson(Map<String, dynamic> json) => Combination(
      combinationOptionVariant: (json['options'] as List<dynamic>?)
          ?.map((e) =>
              CombinationOptionVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      configuredId: json['configured_id'] as String?,
    );

Map<String, dynamic> _$CombinationToJson(Combination instance) =>
    <String, dynamic>{
      'configured_id': instance.configuredId,
      'options': instance.combinationOptionVariant,
    };
