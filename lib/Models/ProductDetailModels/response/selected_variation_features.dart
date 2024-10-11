class SelectedVariationFeatures {
  String? featureId;
  String? purpose;
  String? variant;
  String? variantId;
  bool? isSelected = false;
  SelectedVariationFeatures({this.featureId, this.purpose, this.variant, this.variantId});

  SelectedVariationFeatures.fromJson(Map<String, dynamic> json) {
    featureId = json['feature_id'];
    purpose = json['purpose'];
    variant = json['variant'];
    variantId = json['variant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feature_id'] = this.featureId;
    data['purpose'] = this.purpose;
    data['variant'] = this.variant;
    data['variant_id'] = this.variantId;
    return data;
  }
}