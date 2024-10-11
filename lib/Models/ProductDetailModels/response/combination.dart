import 'package:json_annotation/json_annotation.dart';

import 'combination_option_variant.dart';

part 'combination.g.dart';

@JsonSerializable()
class Combination {

  @JsonKey(name: "configured_id")
  String? configuredId;

  @JsonKey(name: "options")
  List<CombinationOptionVariant>? combinationOptionVariant;

  Combination({this.combinationOptionVariant, this.configuredId});

  factory Combination.fromJson(Map<String, dynamic> json) =>
      _$CombinationFromJson(json);

  Map<String, dynamic> toJson() => _$CombinationToJson(this);
}
