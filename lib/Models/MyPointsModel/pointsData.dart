
import 'package:json_annotation/json_annotation.dart';
part 'pointsData.g.dart';

@JsonSerializable()
class PointsData{

  @JsonKey(name:"change_id")
  String? changeId;

  @JsonKey(name:"action")
  String? action;

  @JsonKey(name:"timestamp")
  String? timestamp;

  @JsonKey(name:"amount")
  String? amount;

  @JsonKey(name:"reason")
  String? reason;

  @JsonKey(name:"order_id")
  String? orderId;

  PointsData(
      this.changeId, this.action, this.timestamp, this.amount, this.reason,this.orderId);


  factory PointsData.fromJson(Map<String, dynamic> json) =>
      _$PointsDataFromJson(json);

  Map<String, dynamic> toJson() => _$PointsDataToJson(this);
  
}