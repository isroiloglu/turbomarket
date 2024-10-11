import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/MyPointsModel/pointsData.dart';
part 'myPointsResponse.g.dart';

@JsonSerializable()
class MyPointResponse{

  @JsonKey(name:"points")
  dynamic? points;

  @JsonKey(name:"error")
  bool? error;

  @JsonKey(name:"success")
  bool? success;

  @JsonKey(name:"userlog")
  List<PointsData>? pointsDataList;

  MyPointResponse(this.points, this.error, this.success, this.pointsDataList);

  factory MyPointResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPointResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyPointResponseToJson(this);
}