
import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ProductDetailModels/response/product_option.dart';

import 'combination.dart';
import 'combination_option_variant.dart';
part 'product_options.g.dart';


@JsonSerializable()
class ProductOptions {
  @JsonKey(name: "options")
  List<ProductOption>? options;


  @JsonKey(name: "selected_options")
  List<CombinationOptionVariant>? selectedOptions;


  @JsonKey(name: "combinations")
  List<Combination>? allCombinations;


  @JsonKey(name: "combination_data")
  Map<dynamic, dynamic>? combinationsData;

  ProductOptions({this.options, this.selectedOptions, this.allCombinations, this.combinationsData});

  factory ProductOptions.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionsToJson(this);
}