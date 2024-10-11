import 'dart:async';

import 'package:floor/floor.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/SearchItem/searchItem.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/database/searchDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';



@Database(version: 1, entities: [SearchItems])
abstract class AppDatabase extends FloorDatabase {
  SearchDao get searchDao;

  static AppDatabase? _database;

  static Future<AppDatabase> getDatabase() async {
    _database ??= await $FloorAppDatabase
        .databaseBuilder("all_4u.db")
        .build();
    return _database!;
  }
}