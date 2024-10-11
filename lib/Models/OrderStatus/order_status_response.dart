import 'package:json_annotation/json_annotation.dart';

part 'order_status_response.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class OrderStatusResponse {
  @JsonKey(defaultValue: false)
  final bool error;
  @JsonKey(name: 'order_id', defaultValue: '')
  final String orderId;
  @JsonKey(name: 'order_status', defaultValue: '')
  final String orderStatus;
  @JsonKey(name: 'is_success', defaultValue: false)
  final bool isSuccess;

  const OrderStatusResponse({
    required this.error,
    required this.orderId,
    required this.orderStatus,
    required this.isSuccess,
  });

  factory OrderStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStatusResponseToJson(this);
}
