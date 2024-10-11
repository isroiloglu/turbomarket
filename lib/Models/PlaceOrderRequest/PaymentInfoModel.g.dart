// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentInfoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInfoModel _$PaymentInfoModelFromJson(Map<String, dynamic> json) =>
    PaymentInfoModel(
      json['selected_card'] as String?,
      json['card_number'] as String?,
      json['expiry_month'] as String?,
      json['expiry_year'] as String?,
      json['account'] as String?,
      json['cardid'] as String?,
      json['otp'] as String?,
    );

Map<String, dynamic> _$PaymentInfoModelToJson(PaymentInfoModel instance) =>
    <String, dynamic>{
      'selected_card': instance.selectedCard,
      'card_number': instance.cardNumber,
      'expiry_month': instance.expiryMonth,
      'expiry_year': instance.expiryYear,
      'account': instance.account,
      'cardid': instance.cardid,
      'otp': instance.otp,
    };
