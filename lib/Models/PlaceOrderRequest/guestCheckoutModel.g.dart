// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guestCheckoutModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestCheckoutModel _$GuestCheckoutModelFromJson(Map<String, dynamic> json) =>
    GuestCheckoutModel(
      json['company_id'] as String?,
      json['currency_code'] as String?,
      json['gc'] as String?,
      json['guest_checkout'] as String?,
      json['lang_code'] as String?,
      json['profile_id'] as String?,
      json['select_gdpr_agreement'] as String?,
      json['ship_to_another'] as int?,
      ProfileData.fromJson(json['user_data'] as Map<String, dynamic>),
      json['user_type'] as String?,
      json['view'] as String?,
      (json['display_subtotal'] as num?)?.toDouble(),
      (json['wallet_system'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GuestCheckoutModelToJson(GuestCheckoutModel instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'currency_code': instance.currencyCode,
      'gc': instance.gc,
      'guest_checkout': instance.guestCheckout,
      'lang_code': instance.langCode,
      'profile_id': instance.profileId,
      'select_gdpr_agreement': instance.selectGdprAgreement,
      'ship_to_another': instance.shipToAnother,
      'user_data': instance.userData,
      'user_type': instance.userType,
      'view': instance.view,
      'display_subtotal': instance.displaySubtotal,
      'wallet_system': instance.walletSystem,
    };
