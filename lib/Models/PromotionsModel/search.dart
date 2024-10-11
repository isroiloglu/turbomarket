
import 'package:json_annotation/json_annotation.dart';
part 'search.g.dart';

@JsonSerializable()
class PromotionSearch{


  @JsonKey(name:"page")
  int? page;

  @JsonKey(name:"total_items")
  String? totalItems;

  PromotionSearch(this.page, this.totalItems);


  factory PromotionSearch.fromJson(Map<String, dynamic> json) =>
      _$PromotionSearchFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionSearchToJson(this);
}