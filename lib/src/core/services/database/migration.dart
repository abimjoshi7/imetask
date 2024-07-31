import 'package:floor/floor.dart';

final migration1to2 = Migration(
  1,
  2,
  (database) async => await database.execute(
      'CREATE TABLE IF NOT EXISTS `Wallet` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `memberType` TEXT NOT NULL, `amount` TEXT NOT NULL, `interestAmount` TEXT NOT NULL, `totalCreditPoints` TEXT NOT NULL, `interestDate` INTEGER NOT NULL, `status` TEXT)'),
);
