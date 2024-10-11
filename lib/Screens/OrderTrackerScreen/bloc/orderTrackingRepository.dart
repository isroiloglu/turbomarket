import 'package:world_miral_cs_cart_multivendor_flutter_app/NetworkManager/api_client.dart';

import '../../../Constants/appConstants.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/OrderTrackModel/orderTrackModel.dart';

abstract class TrackOrderScreenRepository {
  Future<OrderTrackModel> getTrackOrderData(String? id);
}

class TrackOrderRepositoryImp implements TrackOrderScreenRepository {
  @override
  Future<OrderTrackModel> getTrackOrderData(String? id) async {
    return await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).setOrderTrack(
        ApiConstant.authToken,
        id.toString(),
        storageController.getCurrentLanguage(),
        storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString());
  }
}
