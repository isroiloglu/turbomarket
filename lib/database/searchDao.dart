import 'package:floor/floor.dart';

import '../Models/SearchItem/searchItem.dart';

@dao
abstract class SearchDao{
  @Query('SELECT * FROM SearchItems')
  Future<List<SearchItems>> findAllSearchedItems();

  @Query('SELECT * FROM SearchItems WHERE id = :id')
  Stream<SearchItems?> findProductById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProducts(SearchItems items);

  @delete
  Future<void> deleteSearchItem(SearchItems items);
}