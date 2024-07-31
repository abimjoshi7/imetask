// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
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

  WalletDao? _walletDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
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
            'CREATE TABLE IF NOT EXISTS `Wallet` (`id` INTEGER NOT NULL, `memberType` TEXT NOT NULL, `amount` TEXT NOT NULL, `interestAmount` TEXT NOT NULL, `totalCreditPoints` TEXT NOT NULL, `interestDate` INTEGER NOT NULL, `status` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WalletDao get walletDao {
    return _walletDaoInstance ??= _$WalletDao(database, changeListener);
  }
}

class _$WalletDao extends WalletDao {
  _$WalletDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _walletDetailsDTOInsertionAdapter = InsertionAdapter(
            database,
            'Wallet',
            (WalletDetailsDTO item) => <String, Object?>{
                  'id': item.id,
                  'memberType': item.memberType,
                  'amount': item.amount,
                  'interestAmount': item.interestAmount,
                  'totalCreditPoints': item.totalCreditPoints,
                  'interestDate': _dateTimeConverter.encode(item.interestDate),
                  'status': item.status
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WalletDetailsDTO> _walletDetailsDTOInsertionAdapter;

  @override
  Future<WalletDetailsDTO?> findWalletDetailById(int id) async {
    return _queryAdapter.query('SELECT * FROM Wallet WHERE id = ?1',
        mapper: (Map<String, Object?> row) => WalletDetailsDTO(
            amount: row['amount'] as String,
            interestAmount: row['interestAmount'] as String,
            totalCreditPoints: row['totalCreditPoints'] as String,
            interestDate: _dateTimeConverter.decode(row['interestDate'] as int),
            memberType: row['memberType'] as String,
            status: row['status'] as String?,
            id: row['id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<WalletDetailsDTO>> findAllWalletDetails() async {
    return _queryAdapter.queryList('SELECT * FROM Wallet',
        mapper: (Map<String, Object?> row) => WalletDetailsDTO(
            amount: row['amount'] as String,
            interestAmount: row['interestAmount'] as String,
            totalCreditPoints: row['totalCreditPoints'] as String,
            interestDate: _dateTimeConverter.decode(row['interestDate'] as int),
            memberType: row['memberType'] as String,
            status: row['status'] as String?,
            id: row['id'] as int));
  }

  @override
  Stream<List<WalletDetailsDTO>> findAllWalletDetailsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Wallet',
        mapper: (Map<String, Object?> row) => WalletDetailsDTO(
            amount: row['amount'] as String,
            interestAmount: row['interestAmount'] as String,
            totalCreditPoints: row['totalCreditPoints'] as String,
            interestDate: _dateTimeConverter.decode(row['interestDate'] as int),
            memberType: row['memberType'] as String,
            status: row['status'] as String?,
            id: row['id'] as int),
        queryableName: 'Wallet',
        isView: false);
  }

  @override
  Future<void> insertWalletDetail(WalletDetailsDTO walletDetailsDTO) async {
    await _walletDetailsDTOInsertionAdapter.insert(
        walletDetailsDTO, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
