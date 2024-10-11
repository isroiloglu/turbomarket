
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/SearchItem/searchItem.dart';

import 'database.dart';

class DataBaseHelper{


  static void addProducts(SearchItems searchItems){
    AppDatabase.getDatabase().then((value) => {
      value.searchDao.insertProducts(searchItems)
    });

  }

  static void deleteFromDataBase(SearchItems searchItems) async {
    AppDatabase.getDatabase().then((value) => {
      value.searchDao.deleteSearchItem(searchItems)
    });
  }

}