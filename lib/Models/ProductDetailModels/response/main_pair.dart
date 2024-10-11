import 'package:json_annotation/json_annotation.dart';

import 'detailed.dart';
part 'main_pair.g.dart';

@JsonSerializable()
class MainPair{
  @JsonKey(name:"pair_id")

  String? pairId;
  @JsonKey(name:"image_id")

  String? imageId;
  @JsonKey(name:"detailed_id")

  String? detailedId;
  @JsonKey(name:"position")

  String? position;
  @JsonKey(name:"object_id")

  String? objectId;
  @JsonKey(name:"object_type")

  String? objectType;
  @JsonKey(name: "detailed")

  Detailed? detailed;
  @JsonKey(name: "main")
  String? main;
  @JsonKey(name: "thumb")
  String? thumb;
  MainPair({
    this.pairId,
    this.imageId,
    this.detailedId,
    this.position,
    this.objectId,
    this.objectType,
    this.detailed,
    this.main,
    this.thumb
  });

  factory MainPair.fromJson(Map<String, dynamic> json) =>
      _$MainPairFromJson(json);

  Map<String, dynamic> toJson() => _$MainPairToJson(this);
}