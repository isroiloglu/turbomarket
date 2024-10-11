import 'package:json_annotation/json_annotation.dart';
part 'reorder_request.g.dart';

@JsonSerializable()
class ReorderRequest {

  @JsonKey(name: "order_id")
  String? orderId;

  @JsonKey(name: "user_id")
  String? userId;

  @JsonKey(name:"storefront_id")
  String? storefrontId;

  ReorderRequest({this.orderId, this.userId});

  factory ReorderRequest.fromJson(Map<String, dynamic> json) =>
      _$ReorderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReorderRequestToJson(this);
}