import 'dart:async';

import 'package:floor/floor.dart';
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
