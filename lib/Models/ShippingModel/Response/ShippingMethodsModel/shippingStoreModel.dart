import 'package:json_annotation/json_annotation.dart';

part 'shippingStoreModel.g.dart';

@JsonSerializable()
class ShippingStoreModel {

  @JsonKey(name: "store_location_id")
  String? storeLocationId;
  @JsonKey(name: "company_id")
  String? companyId;
  String? position;
  String? country;
  String? state;
  String? latitude;
  String? longitude;
  String? localization;
  String? status;
  @JsonKey(name: "main_destination_id")
  String? mainDestinationId;
  @JsonKey(name: "pickup_destinations_ids")
  String? pickupDestinationsIds;
  @JsonKey(name: "store_type")
  String? storeType;
  @JsonKey(name: "shipping_destinations_ids")
  String? shippingDestinationsIds;
  @JsonKey(name: "lang_code")
  String? langCode;
  String? name;
  String? description;
  String? city;
  @JsonKey(name: "pickup_address")
  String? pickupAddress;
  @JsonKey(name: "pickup_phone")
  String? pickupPhone;
  @JsonKey(name: "pickup_time")
  String? pickupTime;
  @JsonKey(name: "destination_id")
  String? destinationId;
  @JsonKey(name: "pickup_rate")
  int? pickupRate;
  @JsonKey(name: "delivery_time")
  String? deliveryTime;

  ShippingStoreModel.empty();

  ShippingStoreModel({this.storeLocationId,
    this.companyId,
    this.position,
    this.country,
    this.state,
    this.latitude,
    this.longitude,
    this.localization,
    this.status,
    this.mainDestinationId,
    this.pickupDestinationsIds,
    this.storeType,
    this.shippingDestinationsIds,
    this.langCode,
    this.name,
    this.description,
    this.city,
    this.pickupAddress,
    this.pickupPhone,
    this.pickupTime,
    this.destinationId,
    this.pickupRate,
    this.deliveryTime});



  factory ShippingStoreModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingStoreModelToJson(this);
}