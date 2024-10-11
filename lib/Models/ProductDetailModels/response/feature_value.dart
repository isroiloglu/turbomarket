
import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/value_multiple.dart';

part 'feature_value.g.dart';
@JsonSerializable()
class FeatureValue {

  @JsonKey(name:"name")

  String? name;
  @JsonKey(name:"value")

  String? value;
  @JsonKey(name:"feature_style")

  String? featureStyle;
  @JsonKey(name:"values")

  List<String>? values;
  @JsonKey(name:"feature_type")

  String? featureType;

  bool? isMultiple;

  FeatureValue({
     this.name,
     this.value,
     this.featureStyle,
     this.values,
     this.featureType,
     this.isMultiple,
  });

  factory FeatureValue.fromJson(Map<String, dynamic> json) =>
      _$FeatureValueFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureValueToJson(this);

}