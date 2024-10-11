import 'package:floor/floor.dart';

@entity
class SearchItems{
  @primaryKey
  int id=0;
  String searchKey="";

  SearchItems({this.id = 0, this.searchKey = ""});
}