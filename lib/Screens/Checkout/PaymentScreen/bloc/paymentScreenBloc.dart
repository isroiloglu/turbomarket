import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/bloc/paymentScreenEvents.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/bloc/paymentScreenRepository.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Screens/Checkout/PaymentScreen/bloc/paymentScreenStates.dart';

import '../../../../Helper/storageHelper.dart';

class PaymentScreenBloc extends Bloc<PaymentScreenEvents, PaymentScreenState> {
  PaymentScreenRepository? repository;

  PaymentScreenBloc({this.repository}) : super(PaymentScreenInitialState()) {
    on<PaymentScreenEvents>(mapEventToState);
  }

  void mapEventToState(
      PaymentScreenEvents event, Emitter<PaymentScreenState> emit) async {
    emit(PaymentScreenInitialState());
    if (event is PaymentScreenFetchEvent) {
      try {
        var model = await repository?.getPaymentMethods(
            event.shippingId, event.shipToAnother);
        if (model != null) {
          emit(PaymentScreenFetchPaymentMethodState(model));
        } else {
          emit(PaymentScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(PaymentScreenErrorState(error.toString()));
      }
    } else if (event is PaymentScreenCheckoutEvents) {
      try {
        var model = await repository?.submitOrder(event.requestData!);
        if (model != null) {
          emit(PaymentScreenCheckoutState(model));
          storageController.setGiftCode({});
        } else {
          emit(PaymentScreenErrorState(''));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(PaymentScreenErrorState(error.toString()));
      }
    } else if (event is AnorBankGenerateOtpEvent) {
      try {
        var model =
            await repository?.anorBankGenerateOtp(event.creditCardModel!);
        if (model != null && model.success!) {
          emit(AnorBankGenerateOtpSuccess(model));
        } else {
          emit(PaymentScreenErrorState(model!.msg));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(PaymentScreenErrorState(error.toString()));
      }
    } else if (event is AnorBankVerifyOtpEvent) {
      try {
        var model = await repository?.anorBankVerifyOtp(
            event.anorGenerateOtpResponse!, event.otpValue!);
        if (model != null && model.success!) {
          emit(AnorBankVerifyOtpSuccess(model));
        } else {
          emit(PaymentScreenErrorState(model!.msg));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(PaymentScreenErrorState(error.toString()));
      }
    } else if(event is AnorBankVerifyPaymentOtpEvent){
      try {
        var model = await repository?.anorBankVerifyPaymentOtp(
            event.submitOrderResponse!, event.otpValue!);
        if (model != null && model.success!) {
          emit(AnorBankVerifyPaymentOtpSuccess(model, event.submitOrderResponse!));
        } else {
          emit(PaymentScreenErrorState(model!.msg));
        }
      } catch (error, stack) {
        print(stack.toString());
        emit(PaymentScreenErrorState(error.toString()));
      }

    } else if(event is DismissDialogEvent){
      debugPrint("012345678");
      emit(DismissDialogState());
    }
  }
}
