import 'package:json_annotation/json_annotation.dart';
part 'order_taxes.g.dart';

@JsonSerializable()

class OrderTaxes{
  @JsonKey(name:"index")

  String? index;
  @JsonKey(name:"value")

  double? value;
  @JsonKey(name:"formatvalue")

  String? formatValue;

  OrderTaxes(this.index, this.value, this.formatValue);

  factory OrderTaxes.fromJson(Map<String, dynamic> json) =>
      _$OrderTaxesFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTaxesToJson(this);
}