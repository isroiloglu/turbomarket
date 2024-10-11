import 'package:json_annotation/json_annotation.dart';

part 'billing_address.g.dart';

@JsonSerializable()

class BillingAddress{

  @JsonKey(name:"name")

  String? name;
  @JsonKey(name:"address")

  String? address;
  @JsonKey(name:"city")

  String? city;
  @JsonKey(name:"state")

  String? state;
  @JsonKey(name:"country")

  String? country;
  @JsonKey(name:"zipcode")

  String? zipcode;
  @JsonKey(name:"phone")

  String? phone;


  BillingAddress(this.name, this.address, this.city, this.state,
      this.country, this.zipcode, this.phone);

  factory BillingAddress.fromJson(Map<String, dynamic> json) =>
      _$BillingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$BillingAddressToJson(this);
}