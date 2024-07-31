import 'package:fpdart/fpdart.dart' show TaskEither, Unit;
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../features.dart';

@lazySingleton
class GetWalletDetailsUsecase extends UseCase<List<WalletDetails>, Unit> {
  final WalletRepository _repository;

  GetWalletDetailsUsecase({required WalletRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, List<WalletDetails>> call(Unit params) =>
      _repository.findAllWalletDetails();
}
