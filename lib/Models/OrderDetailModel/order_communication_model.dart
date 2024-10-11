import 'package:json_annotation/json_annotation.dart';

part 'order_communication_model.g.dart';

@JsonSerializable()
class OrderCommunicationModel{
  @JsonKey(name:"thread_id")
  String? threadId;

  OrderCommunicationModel(this.threadId);

  factory OrderCommunicationModel.fromJson(Map<String, dynamic> json) =>
      _$OrderCommunicationModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCommunicationModelToJson(this);
}