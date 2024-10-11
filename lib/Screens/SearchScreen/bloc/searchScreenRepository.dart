
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/globalData.dart';

import '../../../Helper/storageHelper.dart';
import '../../../Models/SearchModel/search_suggestion_model.dart';
import '../../../NetworkManager/api_client.dart';

abstract class SearchRepository{
  Future<SearchSuggestionModel> getSearchSuggestion(String pName);

}

class SearchImpRepository implements SearchRepository{
  @override
  Future<SearchSuggestionModel> getSearchSuggestion(String pName) async{
    SearchSuggestionModel? model;
    model = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).getSearchSuggestion(pName, (storageController.getUserData()?.userId??'').toString(),storageController.getCurrentLanguage(),
        storageController.getCurrentCurrency(), storageController.getStoreData()!.storefrontId.toString(),GlobalData.searchFilterHash);
    return model;
  }


}