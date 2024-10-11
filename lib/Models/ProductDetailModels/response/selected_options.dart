class SelectedOptions {
  int? optionId;
  int? variantId;

  SelectedOptions({this.optionId, this.variantId});

  SelectedOptions.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    variantId = json['variant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_id'] = this.optionId;
    data['variant_id'] = this.variantId;
    return data;
  }
}