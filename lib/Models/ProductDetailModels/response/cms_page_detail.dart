import 'package:json_annotation/json_annotation.dart';

part 'cms_page_detail.g.dart';

@JsonSerializable()
class CMSPageDetail {
  @JsonKey(name: "page_id")
  String? pageId;
  @JsonKey(name: "company_id")
  String? companyId;
  @JsonKey(name: "parent_id")
  String? parentId;
  @JsonKey(name: "id_path")
  String? idPath;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "page_type")
  String? pageType;

  @JsonKey(name: "position")
  String? position;

  @JsonKey(name: "timestamp")
  String? timestamp;

  @JsonKey(name: "usergroup_ids")
  String? usergroupIds;

  @JsonKey(name: "localization")
  String? localization;

  @JsonKey(name: "new_window")
  String? newWindow;

  @JsonKey(name: "use_avail_period")
  String? useAvailPeriod;

  @JsonKey(name: "avail_from_timestamp")
  String? availFromTimestamp;

  @JsonKey(name: "avail_till_timestamp")
  String? availTillTimestamp;

  @JsonKey(name: "facebook_obj_type")
  String? facebookObjType;

  @JsonKey(name: "lang_code")
  String? langCode;

  @JsonKey(name: "page")
  String? page;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "meta_keywords")
  String? metaKeywords;
  @JsonKey(name: "meta_description")
  String? metaDescription;
  @JsonKey(name: "page_title")
  String? pageTitle;

  @JsonKey(name: "link")
  String? link;

  CMSPageDetail(
      {this.pageId,
      this.companyId,
      this.parentId,
      this.idPath,
      this.status,
      this.pageType,
      this.position,
      this.timestamp,
      this.usergroupIds,
      this.localization,
      this.newWindow,
      this.useAvailPeriod,
      this.langCode,
      this.page,
      this.description,
      this.metaKeywords,
      this.metaDescription,
      this.pageTitle,
      this.availFromTimestamp,
      this.availTillTimestamp,this.link,this.facebookObjType});

  factory CMSPageDetail.fromJson(Map<String, dynamic> json) =>
      _$CMSPageDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CMSPageDetailToJson(this);
}
