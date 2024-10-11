class Variants {
  String? variantId;
  int? modifier;
  String? variantName;
  String? modifierType;
  String? imagePath;

  Variants({this.variantId, this.modifier, this.variantName, this.modifierType, this.imagePath});

  Variants.fromJson(Map<String, dynamic> json) {
    variantId = json['variant_id'];
    modifier = json['modifier'];
    variantName = json['variant_name'];
    modifierType = json['modifier_type'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_id'] = this.variantId;
    data['modifier'] = this.modifier;
    data['variant_name'] = this.variantName;
    data['modifier_type'] = this.modifierType;
    data['image_path'] = this.imagePath;
    return data;
  }
}