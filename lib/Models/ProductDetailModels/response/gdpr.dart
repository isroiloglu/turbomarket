import 'package:json_annotation/json_annotation.dart';
part 'gdpr.g.dart';

@JsonSerializable()
class GDPR{
  @JsonKey(name:"short_agreement")
  String? shortAgreement;

  @JsonKey(name:"full_agreement")
  String? fullAgreement;

  GDPR({this.fullAgreement, this.shortAgreement});

  factory GDPR.fromJson(Map<String, dynamic> json) =>
      _$GDPRFromJson(json);

  Map<String, dynamic> toJson() => _$GDPRToJson(this);
}