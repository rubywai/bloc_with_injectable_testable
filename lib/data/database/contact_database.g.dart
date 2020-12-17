// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorContactDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ContactDatabaseBuilder databaseBuilder(String name) =>
      _$ContactDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ContactDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ContactDatabaseBuilder(null);
}

class _$ContactDatabaseBuilder {
  _$ContactDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$ContactDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ContactDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ContactDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$ContactDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ContactDatabase extends ContactDatabase {
  _$ContactDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ContactDao _daoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `contact` (`id` TEXT, `name` TEXT, `job` TEXT, `age` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ContactDao get dao {
    return _daoInstance ??= _$ContactDao(database, changeListener);
  }
}

class _$ContactDao extends ContactDao {
  _$ContactDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _contactInsertionAdapter = InsertionAdapter(
            database,
            'contact',
            (Contact item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'job': item.job,
                  'age': item.age
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Contact> _contactInsertionAdapter;

  @override
  Stream<List<Contact>> getContact() {
    return _queryAdapter.queryListStream('select * from contact',
        queryableName: 'contact',
        isView: false,
        mapper: (Map<String, dynamic> row) => Contact(
            row['name'] as String, row['job'] as String, row['age'] as String,
            id: row['id'] as String));
  }

  @override
  Future<List<Contact>> getContactById(String id) async {
    return _queryAdapter.queryList('select * from contact where id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Contact(
            row['name'] as String, row['job'] as String, row['age'] as String,
            id: row['id'] as String));
  }

  @override
  Future<void> addContact(Contact contact) async {
    await _contactInsertionAdapter.insert(contact, OnConflictStrategy.abort);
  }
}
