import 'package:json_annotation/json_annotation.dart';

import 'feature_value.dart';

part 'product_group_feature.g.dart';
@JsonSerializable()
class ProductGroupFeatures {
  @JsonKey(name:"name")
  
  String? name;
  @JsonKey(name:"feature_type")
  
  String? featureType;
  @JsonKey(name:"values")
  
  List<FeatureValue>? values;
  @JsonKey(name:"description")
  
  String? description;
ProductGroupFeatures({this.description, this.name, this.values, this.featureType});

  factory ProductGroupFeatures.fromJson(Map<String, dynamic> json) =>
      _$ProductGroupFeaturesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductGroupFeaturesToJson(this);
  }