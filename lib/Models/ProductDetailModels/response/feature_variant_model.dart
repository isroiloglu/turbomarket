import 'package:json_annotation/json_annotation.dart';

part 'feature_variant_model.g.dart';

@JsonSerializable()
class FeatureVariantModel {
  @JsonKey(name: "feature_id")
  String? featureId;
  @JsonKey(name: "purpose")
  String? purpose;
  @JsonKey(name: "variant")
  String? variant;
  @JsonKey(name: "variant_id")
  String? variantId;
  @JsonKey(name: "product_id")
  String? productId;
  @JsonKey(name: "image_path")
  String? imagePath;
  bool? isSelected=false;

  FeatureVariantModel(
      {this.featureId,
      this.productId,
      this.variantId,
      this.imagePath,
      this.variant,
      this.purpose,this.isSelected});

  factory FeatureVariantModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureVariantModelFromJson(json);

  @override
  String toString() {
    return 'FeatureVariantModel{variant: $variant, variantId: $variantId}';
  }

  Map<String, dynamic> toJson() => _$FeatureVariantModelToJson(this);
}
