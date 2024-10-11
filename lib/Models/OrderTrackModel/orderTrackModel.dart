import 'package:json_annotation/json_annotation.dart';
part 'orderTrackModel.g.dart';

@JsonSerializable()
class OrderTrackModel{

  @JsonKey(name: "trackData")
  bool? trackData;

  @JsonKey(name: "msg")
  String? msg;

  @JsonKey(name: "error")
  bool? error;

  OrderTrackModel({this.trackData, this.msg, this.error});


  factory OrderTrackModel.fromJson(Map<String, dynamic> json) =>
      _$OrderTrackModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTrackModelToJson(this);

}
