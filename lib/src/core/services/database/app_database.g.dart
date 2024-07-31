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

  RewardDao? _rewardDaoInstance;

  UserDao? _userDaoInstance;

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
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Reward` (`id` INTEGER NOT NULL, `currentCredits` INTEGER NOT NULL, `memberType` TEXT NOT NULL, `msisdn` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER NOT NULL, `profileImage` TEXT NOT NULL, `dob` INTEGER NOT NULL, `isEmailVerified` INTEGER NOT NULL, `dobDateFormat` TEXT NOT NULL, `msisdn` TEXT NOT NULL, `accCode` TEXT NOT NULL, `kycApproved` TEXT NOT NULL, `userType` TEXT NOT NULL, `isNomineeAdded` INTEGER NOT NULL, `checkUpdate` TEXT NOT NULL, `isPinSet` INTEGER NOT NULL, `isRaffle` INTEGER NOT NULL, `nfcCardNo` TEXT NOT NULL, `userFullName` TEXT NOT NULL, `isSahayatri` INTEGER NOT NULL, `qrPayload` TEXT NOT NULL, `gender` TEXT NOT NULL, `email` TEXT NOT NULL, `isSahayatriEnabled` INTEGER NOT NULL, `walletType` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WalletDao get walletDao {
    return _walletDaoInstance ??= _$WalletDao(database, changeListener);
  }

  @override
  RewardDao get rewardDao {
    return _rewardDaoInstance ??= _$RewardDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
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

class _$RewardDao extends RewardDao {
  _$RewardDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _rewardDetailsDTOInsertionAdapter = InsertionAdapter(
            database,
            'Reward',
            (RewardDetailsDTO item) => <String, Object?>{
                  'id': item.id,
                  'currentCredits': item.currentCredits,
                  'memberType': item.memberType,
                  'msisdn': item.msisdn
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RewardDetailsDTO> _rewardDetailsDTOInsertionAdapter;

  @override
  Future<RewardDetailsDTO?> findRewardDetailById(int id) async {
    return _queryAdapter.query('SELECT * FROM Reward WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RewardDetailsDTO(
            currentCredits: row['currentCredits'] as int,
            memberType: row['memberType'] as String,
            msisdn: row['msisdn'] as String,
            id: row['id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<RewardDetailsDTO>> findAllRewardDetails() async {
    return _queryAdapter.queryList('SELECT * FROM Reward',
        mapper: (Map<String, Object?> row) => RewardDetailsDTO(
            currentCredits: row['currentCredits'] as int,
            memberType: row['memberType'] as String,
            msisdn: row['msisdn'] as String,
            id: row['id'] as int));
  }

  @override
  Stream<List<RewardDetailsDTO>> findAllRewardDetailsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Reward',
        mapper: (Map<String, Object?> row) => RewardDetailsDTO(
            currentCredits: row['currentCredits'] as int,
            memberType: row['memberType'] as String,
            msisdn: row['msisdn'] as String,
            id: row['id'] as int),
        queryableName: 'Reward',
        isView: false);
  }

  @override
  Future<void> insertRewardDetail(RewardDetailsDTO walletDetailsDTO) async {
    await _rewardDetailsDTOInsertionAdapter.insert(
        walletDetailsDTO, OnConflictStrategy.replace);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _userDetailsDTOInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (UserDetailsDTO item) => <String, Object?>{
                  'id': item.id,
                  'profileImage': item.profileImage,
                  'dob': _dateTimeConverter.encode(item.dob),
                  'isEmailVerified': item.isEmailVerified ? 1 : 0,
                  'dobDateFormat': item.dobDateFormat,
                  'msisdn': item.msisdn,
                  'accCode': item.accCode,
                  'kycApproved': item.kycApproved,
                  'userType': item.userType,
                  'isNomineeAdded': item.isNomineeAdded ? 1 : 0,
                  'checkUpdate': item.checkUpdate,
                  'isPinSet': item.isPinSet ? 1 : 0,
                  'isRaffle': item.isRaffle ? 1 : 0,
                  'nfcCardNo': item.nfcCardNo,
                  'userFullName': item.userFullName,
                  'isSahayatri': item.isSahayatri ? 1 : 0,
                  'qrPayload': item.qrPayload,
                  'gender': item.gender,
                  'email': item.email,
                  'isSahayatriEnabled': item.isSahayatriEnabled ? 1 : 0,
                  'walletType': item.walletType
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserDetailsDTO> _userDetailsDTOInsertionAdapter;

  @override
  Future<UserDetailsDTO?> findUserDetailById(int id) async {
    return _queryAdapter.query('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => UserDetailsDTO(
            profileImage: row['profileImage'] as String,
            dob: _dateTimeConverter.decode(row['dob'] as int),
            isEmailVerified: (row['isEmailVerified'] as int) != 0,
            dobDateFormat: row['dobDateFormat'] as String,
            msisdn: row['msisdn'] as String,
            accCode: row['accCode'] as String,
            kycApproved: row['kycApproved'] as String,
            userType: row['userType'] as String,
            isNomineeAdded: (row['isNomineeAdded'] as int) != 0,
            checkUpdate: row['checkUpdate'] as String,
            isPinSet: (row['isPinSet'] as int) != 0,
            isRaffle: (row['isRaffle'] as int) != 0,
            nfcCardNo: row['nfcCardNo'] as String,
            userFullName: row['userFullName'] as String,
            isSahayatri: (row['isSahayatri'] as int) != 0,
            qrPayload: row['qrPayload'] as String,
            gender: row['gender'] as String,
            email: row['email'] as String,
            isSahayatriEnabled: (row['isSahayatriEnabled'] as int) != 0,
            walletType: row['walletType'] as String,
            id: row['id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<UserDetailsDTO>> findAllUserDetails() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => UserDetailsDTO(
            profileImage: row['profileImage'] as String,
            dob: _dateTimeConverter.decode(row['dob'] as int),
            isEmailVerified: (row['isEmailVerified'] as int) != 0,
            dobDateFormat: row['dobDateFormat'] as String,
            msisdn: row['msisdn'] as String,
            accCode: row['accCode'] as String,
            kycApproved: row['kycApproved'] as String,
            userType: row['userType'] as String,
            isNomineeAdded: (row['isNomineeAdded'] as int) != 0,
            checkUpdate: row['checkUpdate'] as String,
            isPinSet: (row['isPinSet'] as int) != 0,
            isRaffle: (row['isRaffle'] as int) != 0,
            nfcCardNo: row['nfcCardNo'] as String,
            userFullName: row['userFullName'] as String,
            isSahayatri: (row['isSahayatri'] as int) != 0,
            qrPayload: row['qrPayload'] as String,
            gender: row['gender'] as String,
            email: row['email'] as String,
            isSahayatriEnabled: (row['isSahayatriEnabled'] as int) != 0,
            walletType: row['walletType'] as String,
            id: row['id'] as int));
  }

  @override
  Stream<List<UserDetailsDTO>> findAllUserDetailsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => UserDetailsDTO(
            profileImage: row['profileImage'] as String,
            dob: _dateTimeConverter.decode(row['dob'] as int),
            isEmailVerified: (row['isEmailVerified'] as int) != 0,
            dobDateFormat: row['dobDateFormat'] as String,
            msisdn: row['msisdn'] as String,
            accCode: row['accCode'] as String,
            kycApproved: row['kycApproved'] as String,
            userType: row['userType'] as String,
            isNomineeAdded: (row['isNomineeAdded'] as int) != 0,
            checkUpdate: row['checkUpdate'] as String,
            isPinSet: (row['isPinSet'] as int) != 0,
            isRaffle: (row['isRaffle'] as int) != 0,
            nfcCardNo: row['nfcCardNo'] as String,
            userFullName: row['userFullName'] as String,
            isSahayatri: (row['isSahayatri'] as int) != 0,
            qrPayload: row['qrPayload'] as String,
            gender: row['gender'] as String,
            email: row['email'] as String,
            isSahayatriEnabled: (row['isSahayatriEnabled'] as int) != 0,
            walletType: row['walletType'] as String,
            id: row['id'] as int),
        queryableName: 'User',
        isView: false);
  }

  @override
  Future<void> insertUserDetail(UserDetailsDTO walletDetailsDTO) async {
    await _userDetailsDTOInsertionAdapter.insert(
        walletDetailsDTO, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
