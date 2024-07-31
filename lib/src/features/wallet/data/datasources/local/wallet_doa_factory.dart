import 'package:imepay/src/features/wallet/data/datasources/local/wallet_dao.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/database/app_database.dart';

@injectable
class WalletDaoFactory {
  final AppDatabase database;

  WalletDaoFactory(this.database);

  WalletDao create() => database.walletDao;
}
