import '../../../Models/StoreSelectionModels/storeSelectionResponse.dart';
import '../../../NetworkManager/api_client.dart';

abstract class StoreSelectionRepository{

  Future<StoreSelectionResponse> getStoreFrontsData();
}


class StoreSelectionRepositoryImp extends StoreSelectionRepository{
  @override
  Future<StoreSelectionResponse> getStoreFrontsData()  async{
    return await ApiClient().getStoreFronts();
  }

}