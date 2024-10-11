

import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/baseResponse/base_response.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/request/shippingEstimateRequest.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/shippingEstimateModel/response/shippingEstimateResponse.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/ShippingModel/Request/shippingAvailabilityRequest.dart';
import '../../../Models/shippingEstimateModel/request/submitShippingDetails.dart';
import '../../../NetworkManager/api_client.dart';

abstract class ShippingCostEstimationRepository{
  Future<ShippingEstimateResponse> getEstimateShippingCost(ShippingEstimateRequest estimateRequest);
  Future<ShippingMethodModel> getEstimateShippingMethodsBasedOnCountry(ShippingMethodAvailabilityRequest availabilityRequest);
  Future<BaseResponse> submitShippingMethodDetails(SubmitShippingDetails details);
}
class ShippingCostEstimationRepositoryImp implements ShippingCostEstimationRepository{
  @override
  Future<ShippingEstimateResponse> getEstimateShippingCost(ShippingEstimateRequest estimateRequest) async{
    ShippingEstimateResponse model;
    model =  await ApiClient(baseUrl: (storageController.getStoreData()?.url!) ).getShippingEstimatedCost(storageController.getCurrentLanguage(),storageController.getCurrentCurrency(),estimateRequest.isCountry!,storageController.getStoreData()?.storefrontId??"");
    return model;
  }

  @override
  Future<ShippingMethodModel> getEstimateShippingMethodsBasedOnCountry(ShippingMethodAvailabilityRequest availabilityRequest) async{
    ShippingMethodModel model;
    model =  await ApiClient(baseUrl: (storageController.getStoreData()?.url!)).getShippingMethodsBasedOnCountry(storageController.getUserData()?.userId,availabilityRequest);
    return model;
  }


  @override
  Future<BaseResponse> submitShippingMethodDetails(SubmitShippingDetails details) async{
    BaseResponse model;
    model =  await ApiClient(baseUrl: (storageController.getStoreData()?.url!)).submitShippingMethodDetails(storageController.getUserData()?.userId,details);
    return model;
  }

}
