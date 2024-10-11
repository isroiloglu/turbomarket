import 'package:json_annotation/json_annotation.dart';
part 'params.g.dart';

@JsonSerializable()
class OrderParams{

  @JsonKey(name:"page")
  
   dynamic? page;
  @JsonKey(name:"items_per_page")
  
   int? itemsPerPage;
  @JsonKey(name:"user_id")
  
   String? userId;
  @JsonKey(name:"lang_code")
  
   String? langCode;
  @JsonKey(name:"currency_code")
  
   String? currencyCode;
  @JsonKey(name:"include_incompleted")
  
   bool? includeIncompleted;
  @JsonKey(name:"sort_order")
  
   String? sortOrder;
  @JsonKey(name:"sort_by")
  
   String? sortBy;
  @JsonKey(name:"sort_order_rev")
  
   String? sortOrderRev;
  @JsonKey(name:"total_items")
  
   String? totalItems;

  OrderParams(
      this.page,
      this.itemsPerPage,
      this.userId,
      this.langCode,
      this.currencyCode,
      this.includeIncompleted,
      this.sortOrder,
      this.sortBy,
      this.sortOrderRev,
      this.totalItems);


  factory OrderParams.fromJson(Map<String, dynamic> json) =>
      _$OrderParamsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderParamsToJson(this);
}