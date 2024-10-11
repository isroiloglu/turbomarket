
import 'package:json_annotation/json_annotation.dart';
part 'promotions.g.dart';

@JsonSerializable()
class Promotions{

  @JsonKey(name:"promotion_id")
  String? promotionId;

  @JsonKey(name:"company_id")
  String? companyId;

  @JsonKey(name:"to_date")
  String? toDate;

  @JsonKey(name:"from_date")
  String? fromDate;

  @JsonKey(name:"priority")
  String? priority;

  @JsonKey(name:"stop")
  String? stop;

  @JsonKey(name:"stop_other_rules")
  String? stopOtherRules;

  @JsonKey(name:"zone")
  String? zone;

  @JsonKey(name:"conditions_hash")
  String? conditionsHash;

  @JsonKey(name:"status")
  String? status;

  @JsonKey(name:"number_of_usages")
  String? numberOfUsages;

  @JsonKey(name:"users_conditions_hash")
  String? usersConditionsHash;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"detailed_description")
  String? detailedDescription;

  @JsonKey(name:"short_description")
  String? shortDescription;

  @JsonKey(name:"promotion_image_id")
  String? promotionImageId;

  @JsonKey(name:"image")
  String? image;

  Promotions(
      this.promotionId,
      this.companyId,
      this.toDate,
      this.fromDate,
      this.priority,
      this.stop,
      this.stopOtherRules,
      this.zone,
      this.conditionsHash,
      this.status,
      this.numberOfUsages,
      this.usersConditionsHash,
      this.name,
      this.detailedDescription,
      this.shortDescription,
      this.promotionImageId,
      this.image);


  factory Promotions.fromJson(Map<String, dynamic> json) =>
      _$PromotionsFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionsToJson(this);
}


