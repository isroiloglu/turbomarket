import 'package:json_annotation/json_annotation.dart';

part 'shipping_address.g.dart';

@JsonSerializable()

class ShippingAddress{
  
  @JsonKey(name:"name:")
  
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


  ShippingAddress(this.name, this.address, this.city, this.state,
      this.country, this.zipcode, this.phone);

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}