import 'package:world_miral_cs_cart_multivendor_flutter_app/NetworkManager/api_client.dart';

import '../../../../Constants/appConstants.dart';
import '../../../../Helper/storageHelper.dart';
import '../../../../Models/ShippingModel/Request/shipping_method_request.dart';
import '../../../../Models/ShippingModel/Response/ShippingMethodsModel/shipping_method_model.dart';
import '../../../../Models/ShippingModel/checkout_billing_shipping_data.dart';

abstract class ShippingScreenRepository {
  Future<ShippingMethodModel> getShippingMethod(ShippingMethodRequest request);
}

class ShippingScreenRepositoryImp extends ShippingScreenRepository {
  @override
  Future<ShippingMethodModel> getShippingMethod(
      ShippingMethodRequest request) async {
    request.storefrontId=storageController.getStoreData()?.storefrontId??"";
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!)).getShippingMethodData((storageController.getUserData()?.userId??'').toString(),request);
  }
}
