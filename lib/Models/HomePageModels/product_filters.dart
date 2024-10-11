class ProductFiltersModel {
  List<Filters>? filters;
  String? currency;
  String? currencySymbol;

  ProductFiltersModel({this.filters, this.currency, this.currencySymbol});

  ProductFiltersModel.fromJson(Map<String, dynamic> json) {
    if (json['filters'] != null) {
      filters = <Filters>[];
      json['filters'].forEach((v) {
        filters!.add(Filters.fromJson(v));
      });
    }
    currency = json['currency'];
    currencySymbol = json['currency_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters!.map((v) => v.toJson()).toList();
    }
    data['currency'] = this.currency;
    data['currency_symbol'] = this.currencySymbol;
    return data;
  }
}

class Filters {
  String? filterId;
  String? featureId;
  String? fieldType;
  List<Variants>? variants;
  String? description;
  Range? range;

  Filters(
      {this.filterId,
        this.featureId,
        this.variants,
        this.description,
        this.fieldType,
        this.range});

  Filters.fromJson(Map<String, dynamic> json) {
    filterId = json['filter_id'];
    featureId = json['feature_id'];
    fieldType = json['field_type'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    description = json['description'];
    range = json['range'] != null ? Range.fromJson(json['range']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filter_id'] = this.filterId;
    data['feature_id'] = this.featureId;
    data["field_type"] = this.fieldType;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    if (this.range != null) {
      data['range'] = this.range!.toJson();
    }
    return data;
  }
}

class Variants {
  String? variantId;
  String? variant;
  String? featureId;
  bool isSelected=false;

  Variants({this.variantId, this.variant, this.featureId});

  Variants.fromJson(Map<String, dynamic> json) {
    variantId = json['variant_id'];
    variant = json['variant'];
    featureId = json['feature_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_id'] = this.variantId;
    data['variant'] = this.variant;
    data['feature_id'] = this.featureId;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Range {
  String? min;
  String? max;
  String? fieldType;
  String? suffix;

  Range({this.min, this.max, this.fieldType, this.suffix});

  Range.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
    fieldType = json['field_type'];
    suffix = json['suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    data['field_type'] = this.fieldType;
    data['suffix'] = this.suffix;
    return data;
  }
}
