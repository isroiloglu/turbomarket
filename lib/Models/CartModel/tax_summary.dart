import 'package:json_annotation/json_annotation.dart';
part 'tax_summary.g.dart';

@JsonSerializable()
class TaxSummary{
  @JsonKey(name:"included")
  dynamic included;

  @JsonKey(name:"added")
  dynamic added;

  @JsonKey(name:"total")
  dynamic total;

  TaxSummary(this.included, this.added, this.total);

  factory TaxSummary.fromJson(Map<String, dynamic> json) =>
      _$TaxSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$TaxSummaryToJson(this);
}