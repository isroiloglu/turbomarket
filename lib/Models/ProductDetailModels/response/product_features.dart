class ProductFeatures {
  String? name;
  String? featureType;
  String? featureStyle;
  String? value;

  ProductFeatures({this.name, this.featureType, this.featureStyle, this.value});

  ProductFeatures.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    featureType = json['feature_type'];
    featureStyle = json['feature_style'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['feature_type'] = this.featureType;
    data['feature_style'] = this.featureStyle;
    data['value'] = this.value;
    return data;
  }
}