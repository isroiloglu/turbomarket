// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOptions _$ProductOptionsFromJson(Map<String, dynamic> json) =>
    ProductOptions(
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => ProductOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedOptions: (json['selected_options'] as List<dynamic>?)
          ?.map((e) =>
              CombinationOptionVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      allCombinations: (json['combinations'] as List<dynamic>?)
          ?.map((e) => Combination.fromJson(e as Map<String, dynamic>))
          .toList(),
      combinationsData: json['combination_data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ProductOptionsToJson(ProductOptions instance) =>
    <String, dynamic>{
      'options': instance.options,
      'selected_options': instance.selectedOptions,
      'combinations': instance.allCombinations,
      'combination_data': instance.combinationsData,
    };
