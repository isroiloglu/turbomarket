import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AnorBank/anor_generate_otp_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PlaceOrderRequest/placeOrderRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/NetworkManager/api_client.dart';

import '../../../../Constants/appConstants.dart';
import '../../../../Helper/storageHelper.dart';
import '../../../../Models/PaymentMethodModels/payment_method_response.dart';
import '../../../../Models/ShippingModel/Request/submit_order_request.dart';
import '../../../../Models/SubmitOrderModel/submit_order_response.dart';

abstract class PaymentScreenRepository {
  Future<PaymentMethodResponse> getPaymentMethods(
      List<String>? shippingId, int isShipToAnother);
  Future<SubmitOrderResponse> submitOrder(PlaceOrderRequest requestData);
  Future<AnorGenerateOtpResponse> anorBankGenerateOtp(
      CreditCardModel creditCardModel);
  Future<BaseResponse> anorBankVerifyOtp(
      AnorGenerateOtpResponse anorGenerateOtpResponse, String otpValue);
  Future<BaseResponse> anorBankVerifyPaymentOtp(
      SubmitOrderResponse submitOrderResponse, String otpValue);
}

class PaymentScreenRepositoryImp extends PaymentScreenRepository {
  @override
  Future<PaymentMethodResponse> getPaymentMethods(
      List<String>? shippingId, int isShipToAnother) async {
    print("getCoupanCodeTotal${storageController.getCoupanCodeTotal()}");
    var coupanCode = "";
    if (storageController.getCoupanCodeTotal().isEmpty) {
      coupanCode = "";
    } else {
      coupanCode = storageController.getCoupanCodeTotal().substring(1);
    }
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .getPaymentMethodData(
            (storageController.getUserData()?.userId ?? '').toString(),
            AppSizes.width.toInt(),
            storageController.getCurrentLanguage(),
            storageController.getCurrentCurrency(),
            shippingId ?? [""],
            isShipToAnother.toString(),
            "${storageController.getGiftCode().toList().reversed.toList()}"
                .replaceAll(" ", ""),
            coupanCode,
            storageController.getStoreData()!.storefrontId.toString());
  }

  @override
  Future<SubmitOrderResponse> submitOrder(PlaceOrderRequest requestData) async {
    requestData.storeFrontId =
        storageController.getStoreData()?.storefrontId ?? "";

    print(
        "GUEST OBJECT ------>${requestData.guestCheckout.toJson()?.toString() ?? ""}" ??
            "");
    print(
        "USER DATA OBJECT ------>${requestData.guestCheckout.userData.toJson()?.toString() ?? ""}" ??
            "");
    print( "ANOR PAYMENT OBJECT ------>${requestData.paymentInfo.toJson()?.toString() ?? ""}" ??
            "");

    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .submitOrder(
      AppSizes.width.toInt(),
      storageController.getCurrentLanguage(),
      storageController.getCurrentCurrency(),
      requestData,
    );
  }

  @override
  Future<AnorGenerateOtpResponse> anorBankGenerateOtp(
      CreditCardModel creditCardModel) async {
    Map<String, dynamic> cardDetails = {
      "cardnumber": creditCardModel.cardNumber,
      "account": creditCardModel.cardHolderName,
      "exp": creditCardModel.expiryDate.replaceAll("/", ""),
    };

    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .anorBankGenerateOtp(
            ApiConstant.authToken,
            "application/json",
            (storageController.getUserData()?.userId ?? '').toString() ?? "",
            storageController.getCurrentLanguage(),
            storageController.getCurrentCurrency(),
            cardDetails);
  }

  @override
  Future<BaseResponse> anorBankVerifyOtp(
      AnorGenerateOtpResponse anorGenerateOtpResponse, String otpValue) async{
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .anorBankVerifyOtp(
      ApiConstant.authToken,
      "application/json",
      anorGenerateOtpResponse.cardId??"",
      otpValue,
      "verifyCard",
      anorGenerateOtpResponse.refreshToken??"",
    );
  }

  @override
  Future<BaseResponse> anorBankVerifyPaymentOtp(
      SubmitOrderResponse submitOrderResponse, String otpValue) async{
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .anorBankVerifyPaymentOtp(
      ApiConstant.authToken,
      "application/json",
      (submitOrderResponse.orderId??"").toString(),
      submitOrderResponse.billId??"",
      otpValue,
    (storageController.getUserData()?.userId ?? '').toString() ?? "",
      "payment_verify",
    );
  }
}
