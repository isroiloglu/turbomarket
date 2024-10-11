import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/profileData.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PaymentMethodModels/payment_methods.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PlaceOrderRequest/PaymentInfoModel.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/PlaceOrderRequest/guestCheckoutModel.dart';

import '../../../Helper/storageHelper.dart';
import '../../../Models/PaymentMethodModels/payment_method_response.dart';
import '../../../Models/PlaceOrderRequest/placeOrderRequest.dart';

class CheckoutRequestHelper{


  static PlaceOrderRequest getRequestData(PaymentMethodResponse? paymentMethodResponse, PaymentMethod? selectedPaymentMethod,List<String> shippingId, SavedCard? savedCard, String? selectedVendorRecipientId){
    PlaceOrderRequest placeOrderRequest=PlaceOrderRequest.empty();
    placeOrderRequest.storeFrontId=(storageController.getStoreData()?.storefrontId??"")??"";
    placeOrderRequest.afterCouponCodeTotal=paymentMethodResponse?.formatedOrderTotal??"";
    placeOrderRequest.applyWalletCash=false;
    placeOrderRequest.companyId="0";
    placeOrderRequest.currencyCode=storageController.getCurrentCurrency()??"";
    placeOrderRequest.currentCash=0.0;
    placeOrderRequest.gc=storageController.getGiftCode().toList().reversed.toList().toString().replaceAll(" ", "");
    placeOrderRequest.langCode=storageController.getCurrentLanguage()??"";
    placeOrderRequest.notes="";
    placeOrderRequest.paymentId=selectedPaymentMethod?.paymentId??"";

    placeOrderRequest.shippingId=shippingId;
    placeOrderRequest.usedCash=0;
    placeOrderRequest.userId=(storageController.getUserData()?.userId??"").toString();
    placeOrderRequest.displaySubtotal=0.0;
    placeOrderRequest.walletSystem=0;


    GuestCheckoutModel guestCheckoutModel=GuestCheckoutModel.empty();
    guestCheckoutModel.companyId="0";
    guestCheckoutModel.langCode=storageController.getCurrentLanguage()??"";
    guestCheckoutModel.gc=storageController.getGiftCode().toList().reversed.toList().toString().replaceAll(" ", "");

    if(storageController.getLoginStatus()==true){
      guestCheckoutModel.guestCheckout="";
      guestCheckoutModel.shipToAnother=GlobalData.guestUserData.shipToAnother;
      placeOrderRequest.shipToAnother=GlobalData.guestUserData.shipToAnother;
    }else{
      guestCheckoutModel.guestCheckout="Y";
      guestCheckoutModel.shipToAnother=(GlobalData.updateProfileRequest?.shipToAnother)??0;
      placeOrderRequest.shipToAnother=(GlobalData.updateProfileRequest?.shipToAnother)??0;
    }
    guestCheckoutModel.profileId="";
    guestCheckoutModel.selectGdprAgreement="Y";
    guestCheckoutModel.userType="C";
    guestCheckoutModel.view="checkout";
    guestCheckoutModel.displaySubtotal=0.0;
    ProfileData userData = ProfileData.empty();
    if(storageController.getLoginStatus()==true){
      userData.bAddress=GlobalData.updateProfileRequest?.bAddress??"";
      userData.bCity=GlobalData.updateProfileRequest?.bCity??"";
      userData.bCountry=GlobalData.updateProfileRequest?.bCountry??"";
      userData.bEmail="";
      userData.bFirstname=GlobalData.updateProfileRequest?.bFirstname??"";
      userData.bLastname=GlobalData.updateProfileRequest?.bLastname??"";
      userData.bState=GlobalData.updateProfileRequest?.bState??"";
      userData.bZipcode=GlobalData.updateProfileRequest?.bZipcode??"";
      userData.profileName=GlobalData.updateProfileRequest?.profileName??"";
      userData.shipToAnother=GlobalData.updateProfileRequest?.shipToAnother??0;
      userData.userId=GlobalData.updateProfileRequest?.userId??"";
      if((GlobalData.updateProfileRequest?.shipToAnother??0)==0){
        userData.sAddress="";
        userData.sCity="";
        userData.sCountry="";
        userData.sFirstname="";
        userData.sLastname="";
        userData.sPhone="";
        userData.sState="";
        userData.sZipcode="";
      }else{
        userData.sAddress=GlobalData.updateProfileRequest?.sAddress??"";
        userData.sCity=GlobalData.updateProfileRequest?.sCity??"";
        userData.sCountry=GlobalData.updateProfileRequest?.sCountry??"";
        userData.sFirstname=GlobalData.updateProfileRequest?.sFirstName??"";
        userData.sLastname=GlobalData.updateProfileRequest?.sLastName??"";
        userData.sPhone=GlobalData.updateProfileRequest?.sPhone??"";
        userData.sState=GlobalData.updateProfileRequest?.sState??"";
        userData.sZipcode=GlobalData.updateProfileRequest?.sZipcode??"";
      }

    }else{
      userData.bAddress=GlobalData.guestUserData.bAddress??"";
      userData.bCity=GlobalData.guestUserData.bCity??"";
      userData.bCountry=GlobalData.guestUserData.bCountry??"";
      userData.bEmail=GlobalData.guestUserData.bEmail??"";
      userData.bFirstname=GlobalData.guestUserData.bFirstname??"";
      userData.bLastname=GlobalData.guestUserData.bPhone??"";
      userData.bState=GlobalData.guestUserData.bState??"";
      userData.bZipcode=GlobalData.guestUserData.bZipcode??"";
      userData.shipToAnother=GlobalData.guestUserData.shipToAnother??0;
      userData.userId=GlobalData.guestUserData.userId??"";
      userData.profileName="";
      if((GlobalData.guestUserData.shipToAnother??0)==0){
        userData.sAddress="";
        userData.sCity="";
        userData.sCountry="";
        userData.sFirstname="";
        userData.sLastname="";
        userData.sPhone="";
        userData.sState="";
        userData.sZipcode="";

      }else{
        userData.sAddress=GlobalData.guestUserData.sAddress??"";
        userData.sCity=GlobalData.guestUserData.sCity??"";
        userData.sCountry=GlobalData.guestUserData.sCountry??"";
        userData.sFirstname=GlobalData.guestUserData.sFirstname??"";
        userData.sLastname=GlobalData.guestUserData.sLastname??"";
        userData.sPhone=GlobalData.guestUserData.sPhone??"";
        userData.sState=GlobalData.guestUserData.sState??"";
        userData.sZipcode=GlobalData.guestUserData.sZipcode??"";
      }
    }

    PaymentInfoModel paymentInfoModel=PaymentInfoModel.empty();
    paymentInfoModel.selectedCard = (savedCard?.id??"")+"_"+(selectedVendorRecipientId??"");
    paymentInfoModel.cardNumber = "";
    paymentInfoModel.expiryMonth = "";
    paymentInfoModel.expiryYear = "";
    paymentInfoModel.account = "";
    paymentInfoModel.cardid = "";
    paymentInfoModel.otp = "";

    // paymentInfoModel.cardNumber = savedCard?.cardnumber??"";
    // paymentInfoModel.expiryMonth = savedCard?.exp?.substring(0,2)??"";
    // paymentInfoModel.expiryYear = savedCard?.exp?.substring(2,4)??"";
    // paymentInfoModel.account = savedCard?.account??"";
    // paymentInfoModel.cardid = savedCard?.id??"";
    // paymentInfoModel.otp = "";



    guestCheckoutModel.userData=userData;
    placeOrderRequest.paymentInfo=paymentInfoModel;
    placeOrderRequest.guestCheckout=guestCheckoutModel;
    placeOrderRequest.pointsToUse=storageController.getUsedPoint()??"";
    placeOrderRequest.storeId=GlobalData.selectedStore??"";
    return placeOrderRequest;
  }
}