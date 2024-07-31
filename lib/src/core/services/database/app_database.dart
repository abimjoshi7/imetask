import 'dart:async';

import 'package:floor/floor.dart';
import 'package:imepay/src/features/wallet/data/datasources/local/date_time_convertor.dart';
import 'package:imepay/src/features/wallet/data/datasources/local/wallet_dao.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../features/features.dart';

part 'app_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 2, entities: [
  WalletDetailsDTO,
])
abstract class AppDatabase extends FloorDatabase {
  WalletDao get walletDao;
}
