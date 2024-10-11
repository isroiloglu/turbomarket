// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateProfileCheckoutRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileCheckoutRequest _$UpdateProfileCheckoutRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileCheckoutRequest(
      json['company_id'] as String?,
      json['currency_code'] as String?,
      json['gc'] as String?,
      json['lang_code'] as String?,
      json['profile_id'] as String?,
      json['select_gdpr_agreement'] as String?,
      json['update_user_data'] as String?,
      json['user_data'] == null
          ? null
          : ProfileData.fromJson(json['user_data'] as Map<String, dynamic>),
      json['user_type'] as String?,
      json['view'] as String?,
      (json['display_subtotal'] as num?)?.toDouble(),
      (json['wallet_system'] as num?)?.toDouble(),
      json['ship_to_another'] as int?,
      json['storefront_id'] as String?,
    );

Map<String, dynamic> _$UpdateProfileCheckoutRequestToJson(
        UpdateProfileCheckoutRequest instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'currency_code': instance.currencyCode,
      'gc': instance.gc,
      'lang_code': instance.langCode,
      'profile_id': instance.profileId,
      'select_gdpr_agreement': instance.selectGdprAgreement,
      'update_user_data': instance.updateUserData,
      'user_data': instance.userData,
      'user_type': instance.userType,
      'view': instance.view,
      'ship_to_another': instance.shipToAnother,
      'display_subtotal': instance.displaySubtotal,
      'wallet_system': instance.walletSystem,
      'storefront_id': instance.storefrontId,
    };
