import 'package:json_annotation/json_annotation.dart';

part 'variant.g.dart';

@JsonSerializable()
class Variant {
  @JsonKey(name: "variant_id")
  String? variantId;
  @JsonKey(name: "option_id")
  dynamic optionId;
  @JsonKey(name: "position")
  String? position;

  @JsonKey(name: "modifier")
  dynamic modifier;

  @JsonKey(name: "modifier_type")
  String? modifierType;
  @JsonKey(name: "weight_modifier")
  String? weightModifier;
  @JsonKey(name: "weight_modifier_type")
  String? weightModifierType;
  @JsonKey(name: "point_modifier")
  String? pointModifier;
  @JsonKey(name: "point_modifier_type")
  String? pointModifierType;
  @JsonKey(name: "variant_name")
  String? variantName;
  @JsonKey(name: "image_path")
  String? imagePath;

//    @JsonKey(name:("image_pair")
//    @Expose
//    private List<Object> imagePair = null;
  @JsonKey(name: "format_modifier")
  String? formatModifier;

  @JsonKey(ignore: true)
  bool? isSelected = false;

  Variant({
    this.variantId,
    this.optionId,
    this.position,
    this.modifier,
    this.modifierType,
    this.weightModifier,
    this.weightModifierType,
    this.pointModifier,
    this.pointModifierType,
    this.variantName,
    this.imagePath,
    this.formatModifier
  });


  @override
  String toString() {
    return 'Variant{isSelected: $isSelected}';
  }

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String?, dynamic> toJson() => _$VariantToJson(this);
}
