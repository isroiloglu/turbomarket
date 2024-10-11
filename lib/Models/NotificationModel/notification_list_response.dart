import 'package:json_annotation/json_annotation.dart';

part 'notification_list_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "type_data")
  String? typeData;

  @JsonKey(name: "content")
  String? content;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "time")
  String? time;

  @JsonKey(name: "image_path")
  String imagePath;

  NotificationResponse({
    this.id,
    this.title,
    this.type,
    this.typeData,
    this.content,
    this.status,
    this.time,
    required this.imagePath,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
