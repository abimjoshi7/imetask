import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../features.dart';

@lazySingleton
class InsertWalletDetailUsecase extends UseCase<void, WalletDetails> {
  final WalletRepository _repository;

  InsertWalletDetailUsecase({required WalletRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, void> call(WalletDetails params) =>
      _repository.insert(params);
}
