import 'package:json_annotation/json_annotation.dart';

import '../HomePageModels/product_filters.dart';
import '../HomePageModels/product_item.dart';

part 'search_suggestion_model.g.dart';

@JsonSerializable()
class SearchSuggestionModel {

  @JsonKey(name:"search_data")
  List<ProductItem>? searchData;
  List<Filters>? filter;

  @JsonKey(name:"filters")
  List<Filters>? filterList;

  SearchSuggestionModel(this.searchData,this.filterList);

  factory SearchSuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSuggestionModelToJson(this);
}
