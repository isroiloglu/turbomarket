// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureValue _$FeatureValueFromJson(Map<String, dynamic> json) => FeatureValue(
      name: json['name'] as String?,
      value: json['value'] as String?,
      featureStyle: json['feature_style'] as String?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
      featureType: json['feature_type'] as String?,
      isMultiple: json['isMultiple'] as bool?,
    );

Map<String, dynamic> _$FeatureValueToJson(FeatureValue instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'feature_style': instance.featureStyle,
      'values': instance.values,
      'feature_type': instance.featureType,
      'isMultiple': instance.isMultiple,
    };
