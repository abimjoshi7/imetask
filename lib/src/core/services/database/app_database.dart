import 'dart:async';

import 'package:floor/floor.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../features/features.dart';
import '../../../features/profile/data/datasources/local/user_dao.dart';
import '../../../features/reward/data/datasources/datasources.dart';

part 'app_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 2, entities: [
  WalletDetailsDTO,
  RewardDetailsDTO,
  UserDetailsDTO,
])
abstract class AppDatabase extends FloorDatabase {
  WalletDao get walletDao;
  RewardDao get rewardDao;
  UserDao get userDao;
}
