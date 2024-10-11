

import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AnorBank/anor_generate_otp_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';

import '../../../../Models/PaymentMethodModels/payment_method_response.dart';
import '../../../../Models/SubmitOrderModel/submit_order_response.dart';

abstract class PaymentScreenState {}

class PaymentScreenInitialState extends PaymentScreenState{
  @override
  List<Object> get props => [];
}

class PaymentScreenFetchPaymentMethodState extends PaymentScreenState{
  PaymentMethodResponse paymentMethodResponse;

  PaymentScreenFetchPaymentMethodState(this.paymentMethodResponse);
  @override
  List<Object> get props => [];
}


class PaymentCompleteState extends PaymentScreenState{}

class PaymentScreenCheckoutState extends PaymentScreenState{
  SubmitOrderResponse submitOrderResponse;

  PaymentScreenCheckoutState(this.submitOrderResponse);

  @override
  List<Object> get props => [];
}

class PaymentScreenErrorState extends PaymentScreenState {
  PaymentScreenErrorState(this._message);

  String? _message;

  String? get message => _message;

  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}

class PaymentScreenEmptyState extends PaymentScreenState{

}

class AnorBankGenerateOtpSuccess extends PaymentScreenState{
  AnorGenerateOtpResponse? model;
  AnorBankGenerateOtpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class AnorBankVerifyOtpSuccess extends PaymentScreenState{
  BaseResponse? model;
  AnorBankVerifyOtpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class AnorBankVerifyPaymentOtpSuccess extends PaymentScreenState{
  BaseResponse? model;
  SubmitOrderResponse? submitOrderResponse;
  AnorBankVerifyPaymentOtpSuccess(this.model, this.submitOrderResponse);

  @override
  List<Object> get props => [];
}

class DismissDialogState extends PaymentScreenState{
  @override
  List<Object> get props => [];
}