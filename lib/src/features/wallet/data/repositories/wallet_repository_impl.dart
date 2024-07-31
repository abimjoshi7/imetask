import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../features.dart';
import '../datasources/local/wallet_local_ds.dart';

@LazySingleton(as: WalletRepository)
class WalletRepositoryImpl implements WalletRepository {
  final WalletLocalDs _walletLocalDs;

  WalletRepositoryImpl({required WalletLocalDs walletLocalDs})
      : _walletLocalDs = walletLocalDs;

  @override
  TaskEither<String, List<WalletDetails>> findAllWalletDetails() =>
      TaskEither.tryCatch(
        () async => _walletLocalDs.findAllWalletDetails(),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, WalletDetails?> findWalletDetailById(int id) =>
      TaskEither.tryCatch(
        () async => _walletLocalDs.findWalletDetailById(id),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, void> insertWalletDetail(WalletDetails params) =>
      TaskEither.tryCatch(
        () => _walletLocalDs.insertWalletDetail(
          WalletDetailsDTO.fromJson(
            params.toMap(),
          ),
        ),
        (error, _) => error.toString(),
      );
}
