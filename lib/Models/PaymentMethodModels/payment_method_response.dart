
import 'package:json_annotation/json_annotation.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PaymentMethodModels/payment_methods.dart';
part 'payment_method_response.g.dart';

@JsonSerializable()
class PaymentMethodResponse{

  @JsonKey(name:"payment_method")
  List<PaymentMethod> paymentMethod;

  @JsonKey(name:"order_total")
  double? orderTotal;

  @JsonKey(name:"formated_order_total")
  String? formatedOrderTotal;

  @JsonKey(name:"currency_code")
  String? currencyCode;

  @JsonKey(name:"error")
  bool? error;

  @JsonKey(name:"msg")
  String? msg;

  PaymentMethodResponse(
      {required this.paymentMethod,
        this.orderTotal,
        this.formatedOrderTotal,
        this.currencyCode,
        this.error,
        this.msg});

  factory PaymentMethodResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodResponseToJson(this);

}