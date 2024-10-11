import 'package:json_annotation/json_annotation.dart';

part 'search_data.g.dart';

@JsonSerializable()
class SearchData {
  @JsonKey(name:"product_id")
  String? productId;

  @JsonKey(name:"product")
  String? product;


  SearchData(this.productId, this.product);

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataToJson(this);
}
