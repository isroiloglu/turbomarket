import 'package:json_annotation/json_annotation.dart';
part 'page.g.dart';


@JsonSerializable()
class CMSPage{

  @JsonKey(name: "page_id")
  String? pageId;

  @JsonKey(name: "page_name")
  String? pageName;

  CMSPage(this.pageId, this.pageName);


  factory CMSPage.fromJson(Map<String, dynamic> json) =>
      _$CMSPageFromJson(json);

  Map<String, dynamic> toJson() => _$CMSPageToJson(this);
}