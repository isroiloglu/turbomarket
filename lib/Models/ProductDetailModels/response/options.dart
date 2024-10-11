
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/variants.dart';

class Options {
  List<Variants>? variants;
  int? optionId;
  String? optionType;
  String? optionName;
  String? comment;
  String? required;
  Null? inventory;

  Options({this.variants, this.optionId, this.optionType, this.optionName, this.comment, this.required, this.inventory});

  Options.fromJson(Map<String, dynamic> json) {
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) { variants!.add(new Variants.fromJson(v)); });
    }
    optionId = json['option_id'];
    optionType = json['option_type'];
    optionName = json['option_name'];
    comment = json['comment'];
    required = json['required'];
    inventory = json['inventory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['option_id'] = this.optionId;
    data['option_type'] = this.optionType;
    data['option_name'] = this.optionName;
    data['comment'] = this.comment;
    data['required'] = this.required;
    data['inventory'] = this.inventory;
    return data;
  }
}