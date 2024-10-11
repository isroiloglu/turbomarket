import 'package:json_annotation/json_annotation.dart';

import '../../ProductDetailModels/response/product_options.dart';
import 'extra.dart';


@JsonSerializable()
class ProductRequestData{

  @JsonKey(name: "amount")
  String? amount;


  @JsonKey(name: "product_id")
  String? productId;

  @JsonKey(name: "extra")
  Extra? extra;

  ProductRequestData(
      this.amount, this.productId, this.extra, this.productOptions);

  @JsonKey(name: "product_options")
  ProductOptions? productOptions;

}