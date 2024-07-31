import 'dart:async';

import 'package:floor/floor.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../features/features.dart';

part 'app_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [
  WalletDetailsDTO,
  RewardDetailsDTO,
  UserDetailsDTO,
  HomeMenu,
  MenuItem,
  SubMenuItem,
])
abstract class AppDatabase extends FloorDatabase {
  WalletDao get walletDao;
  RewardDao get rewardDao;
  UserDao get userDao;
  HomeMenuDao get homeMenuDao;
  MenuItemDao get menuItemDao;
  SubMenuItemDao get subMenuItemDao;
}
