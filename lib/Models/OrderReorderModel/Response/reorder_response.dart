import 'package:json_annotation/json_annotation.dart';
part 'reorder_response.g.dart';

@JsonSerializable()
class ReorderResponse {

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "product_total")
  dynamic productTotal;

  @JsonKey(name: "added")
  bool? added;

  @JsonKey(name: "error")
  bool? error;


  ReorderResponse(this.message, this.productTotal, this.added, this.error);

  factory ReorderResponse.fromJson(Map<String, dynamic> json) =>
      _$ReorderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReorderResponseToJson(this);
}