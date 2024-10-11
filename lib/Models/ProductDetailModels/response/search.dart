import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  @JsonKey(name:"page")
  
  int? page;
  @JsonKey(name:"thread_id")
  
  String? threadId;
  @JsonKey(name:"avail_only")
  
  bool? availOnly;
  @JsonKey(name:"random")
  
  bool? random;
  @JsonKey(name:"items_per_page")
  
  int? itemsPerPage;
  @JsonKey(name:"total_items")
  
  String? totalItems;

  @JsonKey(name:"search")
  
   Search? search;

  Search({
     this.page,
     this.threadId,
     this.availOnly,
     this.random,
     this.itemsPerPage,
     this.totalItems,
     this.search,
  });

  factory Search.fromJson(Map<String, dynamic> json) =>
      _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}