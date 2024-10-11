


import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AnorBank/anor_generate_otp_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/SubmitOrderModel/submit_order_response.dart';

import '../../../../Models/PlaceOrderRequest/placeOrderRequest.dart';
import '../../../../Models/ShippingModel/Request/submit_order_request.dart';

abstract class PaymentScreenEvents {}

class PaymentScreenFetchEvent extends PaymentScreenEvents{
  List<String>? shippingId;
  int shipToAnother;
  PaymentScreenFetchEvent(this.shippingId,this.shipToAnother );

  @override
  // implement props
  List<Object> get props => [];
}

class PaymentScreenCheckoutEvents extends PaymentScreenEvents{
  PlaceOrderRequest? requestData;
  PaymentScreenCheckoutEvents(this.requestData);

  @override
  // implement props
  List<Object> get props => [];

}

class AnorBankGenerateOtpEvent extends PaymentScreenEvents{
  CreditCardModel? creditCardModel;
  AnorBankGenerateOtpEvent(this.creditCardModel);

  @override
  List<Object> get props => [];
}

class AnorBankVerifyOtpEvent extends PaymentScreenEvents{
  String? otpValue;
  AnorGenerateOtpResponse? anorGenerateOtpResponse;
  AnorBankVerifyOtpEvent(this.otpValue, this.anorGenerateOtpResponse);

  @override
  List<Object> get props => [];
}

class AnorBankVerifyPaymentOtpEvent extends PaymentScreenEvents{
  String? otpValue;
  SubmitOrderResponse? submitOrderResponse;
  AnorBankVerifyPaymentOtpEvent(this.otpValue, this.submitOrderResponse);

  @override
  List<Object> get props => [];
}


class DismissDialogEvent extends PaymentScreenEvents{
  @override
  List<Object> get props => [];
}
