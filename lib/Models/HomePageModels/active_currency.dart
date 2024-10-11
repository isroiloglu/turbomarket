import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
part 'active_currency.g.dart';

@JsonSerializable()
class ActiveCurrency{

  @JsonKey(name: "currency_id")
  String? currencyId;

  @JsonKey(name: "currency_code")
  String? currencyCode;

  @JsonKey(name: "symbol")
  String? symbol;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "decimals")
  String? decimals;

  ActiveCurrency(this.currencyId, this.currencyCode, this.symbol,
      this.description, this.status, this.decimals);

  factory ActiveCurrency.fromJson(Map<String, dynamic> json) =>
      _$ActiveCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveCurrencyToJson(this);
}