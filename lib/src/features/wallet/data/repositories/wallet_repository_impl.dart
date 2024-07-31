import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:injectable/injectable.dart';

import '../../../features.dart';

@LazySingleton(as: WalletRepository)
class WalletRepositoryImpl implements WalletRepository {
  final WalletLocalDs _walletLocalDs;

  WalletRepositoryImpl({required WalletLocalDs walletLocalDs})
      : _walletLocalDs = walletLocalDs;

  @override
  TaskEither<String, List<WalletDetails>> findAll() => TaskEither.tryCatch(
        () async => _walletLocalDs.findAllWalletDetails(),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, WalletDetails?> findById(int id) => TaskEither.tryCatch(
        () async => _walletLocalDs.findWalletDetailById(id),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, void> insert(WalletDetails params) => TaskEither.tryCatch(
        () => _walletLocalDs.insertWalletDetail(
          WalletDetailsDTO.fromJson(
            params.toMap(),
          ),
        ),
        (error, _) => error.toString(),
      );
}
