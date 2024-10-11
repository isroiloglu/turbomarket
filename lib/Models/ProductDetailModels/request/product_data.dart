import 'package:json_annotation/json_annotation.dart';

part 'product_data.g.dart';

@JsonSerializable()
class ProductData {
  @JsonKey(name: "amount")
  String? amount;

  @JsonKey(name: "product_options")
  Map<String, String>? productOptions;

  @JsonKey(name: "extra")
  Map<String, String>? extra;

  @JsonKey(name: "product_id")
  String? productId;

  @JsonKey(name: "object_id")
  String? objectId;

  ProductData({
    this.amount,
    this.productOptions,
    this.extra,
    this.productId,
    this.objectId,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    productOptions = json['product_options'];
    extra = json['extra'];
    productId = json['product_id'];
    objectId = json['object_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = amount;
    data['product_options'] = productOptions;
    //if (extra != null)
    data['extra'] = extra;
    data['product_id'] = productId;
    if (objectId != null) data['object_id'] = objectId;
    return data;
  }
}
