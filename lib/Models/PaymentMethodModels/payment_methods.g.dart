// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      paymentId: json['payment_id'] as String?,
      payment: json['payment'] as String?,
      description: json['description'] as String?,
      paymentProcessor: json['payment_processor'] as String?,
      paymentInstruction: json['payment_instruction'] as String?,
      paymentSurcharge: (json['payment_surcharge'] as num?)?.toDouble(),
      formatedPaymentSurcharge: json['formated_payment_surcharge'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      formatedPrice: json['formated_price'] as String?,
      savedCard: (json['saved_card'] as List<dynamic>?)
          ?.map((e) => SavedCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      vendorRecipient: json['vendor_recipient'] == null
          ? null
          : VendorRecipient.fromJson(
              json['vendor_recipient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'payment_id': instance.paymentId,
      'payment': instance.payment,
      'description': instance.description,
      'payment_processor': instance.paymentProcessor,
      'payment_instruction': instance.paymentInstruction,
      'payment_surcharge': instance.paymentSurcharge,
      'formated_payment_surcharge': instance.formatedPaymentSurcharge,
      'price': instance.price,
      'formated_price': instance.formatedPrice,
      'saved_card': instance.savedCard,
      'vendor_recipient': instance.vendorRecipient,
    };

SavedCard _$SavedCardFromJson(Map<String, dynamic> json) => SavedCard(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      vendorId: json['vendor_id'] as String?,
      account: json['account'] as String?,
      cardnumber: json['cardnumber'] as String?,
      exp: json['exp'] as String?,
    );

Map<String, dynamic> _$SavedCardToJson(SavedCard instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'vendor_id': instance.vendorId,
      'account': instance.account,
      'cardnumber': instance.cardnumber,
      'exp': instance.exp,
    };

VendorRecipient _$VendorRecipientFromJson(Map<String, dynamic> json) =>
    VendorRecipient(
      simpleRecipientId: json['simple_recipient_id'] as String?,
      threemonthRecipientId: json['3month_recipient_id'] as String?,
      sixmonthRecipientId: json['6month_recipient_id'] as String?,
      twelvemonthRecipientId: json['12month_recipient_id'] as String?,
    );

Map<String, dynamic> _$VendorRecipientToJson(VendorRecipient instance) =>
    <String, dynamic>{
      'simple_recipient_id': instance.simpleRecipientId,
      '3month_recipient_id': instance.threemonthRecipientId,
      '6month_recipient_id': instance.sixmonthRecipientId,
      '12month_recipient_id': instance.twelvemonthRecipientId,
    };
