import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';

import '../../../Helper/storageHelper.dart';
import '../../../Models/HomePageModels/home_screen_models.dart';
import '../../../NetworkManager/api_client.dart';

abstract class HomeScreenRepository {
  Future<HomeScreenModels> getHomeData();
}

class HomeScreenRepositoryImp implements HomeScreenRepository {
  @override
  Future<HomeScreenModels> getHomeData() async {
    return await ApiClient(baseUrl: (storageController.getStoreData()?.url))
        .getHomePageData(
            ((storageController.getUserData()?.userId ?? '').toString() ?? '')
                .toString(),
            AppSizes.width.toInt(),
            storageController.getCurrentLanguage(),
            storageController.getCurrentCurrency(),
            storageController.getStoreData()?.storefrontId ?? '');
  }
}
