import 'package:json_annotation/json_annotation.dart';
part 'payment_methods.g.dart';

@JsonSerializable()
class PaymentMethod {
  @JsonKey(name: "payment_id")
  String? paymentId;

  @JsonKey(name: "payment")
  String? payment;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "payment_processor")
  String? paymentProcessor;

  @JsonKey(name: "payment_instruction")
  String? paymentInstruction;

  @JsonKey(name: "payment_surcharge")
  double? paymentSurcharge;

  @JsonKey(name: "formated_payment_surcharge")
  String? formatedPaymentSurcharge;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "formated_price")
  String? formatedPrice;

  @JsonKey(name: "saved_card")
  List<SavedCard>? savedCard;
  @JsonKey(name: "vendor_recipient")
  VendorRecipient? vendorRecipient;

  PaymentMethod.empty();

  PaymentMethod({
    this.paymentId,
    this.payment,
    this.description,
    this.paymentProcessor,
    this.paymentInstruction,
    this.paymentSurcharge,
    this.formatedPaymentSurcharge,
    this.price,
    this.formatedPrice,
    this.savedCard,
    this.vendorRecipient,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}

@JsonSerializable()
class SavedCard {
  String? id;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'vendor_id')
  String? vendorId;
  String? account;
  String? cardnumber;
  String? exp;

  SavedCard.empty();

  SavedCard({
    this.id,
    this.userId,
    this.vendorId,
    this.account,
    this.cardnumber,
    this.exp,
  });

  factory SavedCard.fromJson(Map<String, dynamic> json) =>
      _$SavedCardFromJson(json);

  Map<String, dynamic> toJson() => _$SavedCardToJson(this);
}

@JsonSerializable()
class VendorRecipient {
  @JsonKey(name: 'simple_recipient_id')
  final String? simpleRecipientId;
  @JsonKey(name: '3month_recipient_id')
  final String? threemonthRecipientId;
  @JsonKey(name: '6month_recipient_id')
  final String? sixmonthRecipientId;
  @JsonKey(name: '12month_recipient_id')
  final String? twelvemonthRecipientId;

  const VendorRecipient({
    this.simpleRecipientId,
    this.threemonthRecipientId,
    this.sixmonthRecipientId,
    this.twelvemonthRecipientId,
  });

  factory VendorRecipient.fromJson(Map<String, dynamic> json) =>
      _$VendorRecipientFromJson(json);

  Map<String, dynamic> toJson() => _$VendorRecipientToJson(this);
}
