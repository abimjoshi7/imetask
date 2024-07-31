import 'package:fpdart/fpdart.dart' show TaskEither;

import '../../../features.dart';

abstract class WalletRepository {
  TaskEither<String, List<WalletDetails>> findAllWalletDetails();
  TaskEither<String, WalletDetails?> findWalletDetailById(int id);
  TaskEither<String, void> insertWalletDetail(WalletDetails params);
}
