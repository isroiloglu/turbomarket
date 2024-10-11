// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shippingStoreModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingStoreModel _$ShippingStoreModelFromJson(Map<String, dynamic> json) =>
    ShippingStoreModel(
      storeLocationId: json['store_location_id'] as String?,
      companyId: json['company_id'] as String?,
      position: json['position'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      localization: json['localization'] as String?,
      status: json['status'] as String?,
      mainDestinationId: json['main_destination_id'] as String?,
      pickupDestinationsIds: json['pickup_destinations_ids'] as String?,
      storeType: json['store_type'] as String?,
      shippingDestinationsIds: json['shipping_destinations_ids'] as String?,
      langCode: json['lang_code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      city: json['city'] as String?,
      pickupAddress: json['pickup_address'] as String?,
      pickupPhone: json['pickup_phone'] as String?,
      pickupTime: json['pickup_time'] as String?,
      destinationId: json['destination_id'] as String?,
      pickupRate: json['pickup_rate'] as int?,
      deliveryTime: json['delivery_time'] as String?,
    );

Map<String, dynamic> _$ShippingStoreModelToJson(ShippingStoreModel instance) =>
    <String, dynamic>{
      'store_location_id': instance.storeLocationId,
      'company_id': instance.companyId,
      'position': instance.position,
      'country': instance.country,
      'state': instance.state,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'localization': instance.localization,
      'status': instance.status,
      'main_destination_id': instance.mainDestinationId,
      'pickup_destinations_ids': instance.pickupDestinationsIds,
      'store_type': instance.storeType,
      'shipping_destinations_ids': instance.shippingDestinationsIds,
      'lang_code': instance.langCode,
      'name': instance.name,
      'description': instance.description,
      'city': instance.city,
      'pickup_address': instance.pickupAddress,
      'pickup_phone': instance.pickupPhone,
      'pickup_time': instance.pickupTime,
      'destination_id': instance.destinationId,
      'pickup_rate': instance.pickupRate,
      'delivery_time': instance.deliveryTime,
    };
