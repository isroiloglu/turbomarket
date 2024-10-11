// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submitDataRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitUserDataRequest _$SubmitUserDataRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitUserDataRequest(
      json['company_id'] as String?,
      (json['wallet_system'] as num?)?.toDouble(),
      (json['display_subtotal'] as num?)?.toDouble(),
      json['view'] as String?,
      json['user_type'] as String?,
      json['ship_to_another'] as int?,
      json['select_gdpr_agreement'] as String?,
      json['lang_code'] as String?,
      json['guest_checkout'] as String?,
      json['gc'] as String?,
      json['currency_code'] as String?,
      json['user_data'] == null
          ? null
          : GuestUserData.fromJson(json['user_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitUserDataRequestToJson(
        SubmitUserDataRequest instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'wallet_system': instance.walletSystem,
      'display_subtotal': instance.displaySubtotal,
      'view': instance.view,
      'user_type': instance.userType,
      'ship_to_another': instance.shipToAnother,
      'select_gdpr_agreement': instance.selectGdprAgreement,
      'lang_code': instance.langCode,
      'guest_checkout': instance.guestCheckout,
      'gc': instance.gc,
      'currency_code': instance.currencyCode,
      'user_data': instance.userData,
    };
