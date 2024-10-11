// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingMethodRequest _$ShippingMethodRequestFromJson(
        Map<String, dynamic> json) =>
    ShippingMethodRequest(
      json['currency_code'] as String?,
      (json['gc'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['lang_code'] as String?,
      json['profile_id'] as String?,
      json['update_user_data'] as String?,
      json['view'] as String?,
      json['storefront_id'] as String?,
    );

Map<String, dynamic> _$ShippingMethodRequestToJson(
        ShippingMethodRequest instance) =>
    <String, dynamic>{
      'currency_code': instance.currencyCode,
      'gc': instance.gc,
      'lang_code': instance.langCode,
      'profile_id': instance.profileId,
      'update_user_data': instance.updateUserData,
      'view': instance.view,
      'storefront_id': instance.storefrontId,
    };
