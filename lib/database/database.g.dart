// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SearchDao? _searchDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SearchItems` (`id` INTEGER NOT NULL, `searchKey` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SearchDao get searchDao {
    return _searchDaoInstance ??= _$SearchDao(database, changeListener);
  }
}

class _$SearchDao extends SearchDao {
  _$SearchDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _searchItemsInsertionAdapter = InsertionAdapter(
            database,
            'SearchItems',
            (SearchItems item) =>
                <String, Object?>{'id': item.id, 'searchKey': item.searchKey},
            changeListener),
        _searchItemsDeletionAdapter = DeletionAdapter(
            database,
            'SearchItems',
            ['id'],
            (SearchItems item) =>
                <String, Object?>{'id': item.id, 'searchKey': item.searchKey},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SearchItems> _searchItemsInsertionAdapter;

  final DeletionAdapter<SearchItems> _searchItemsDeletionAdapter;

  @override
  Future<List<SearchItems>> findAllSearchedItems() async {
    return _queryAdapter.queryList('SELECT * FROM SearchItems',
        mapper: (Map<String, Object?> row) => SearchItems(
            id: row['id'] as int, searchKey: row['searchKey'] as String));
  }

  @override
  Stream<SearchItems?> findProductById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM SearchItems WHERE id = ?1',
        mapper: (Map<String, Object?> row) => SearchItems(
            id: row['id'] as int, searchKey: row['searchKey'] as String),
        arguments: [id],
        queryableName: 'SearchItems',
        isView: false);
  }

  @override
  Future<void> insertProducts(SearchItems items) async {
    await _searchItemsInsertionAdapter.insert(
        items, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSearchItem(SearchItems items) async {
    await _searchItemsDeletionAdapter.delete(items);
  }
}
