import '../../../Helper/storageHelper.dart';
import '../../../Models/MyPointsModel/myPointsResponse.dart';
import '../../../NetworkManager/api_client.dart';

abstract class MyPointsRepository {
  Future<MyPointResponse?> fetchPointsData();
}

class MyPointsRepositoryImp extends MyPointsRepository {
  @override
  Future<MyPointResponse?> fetchPointsData() async {
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url!))
        .getRewardsPoints(
            ((storageController.getUserData()?.userId??'').toString()) ?? "",
            (storageController.getStoreData()?.storefrontId) ?? "",
            storageController.getCurrentLanguage(),
            storageController.getCurrentCurrency());
  }
}
