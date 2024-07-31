import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../features.dart';

@lazySingleton
class GetWalletDetailUsecase extends UseCase<WalletDetails?, int> {
  final WalletRepository _repository;

  GetWalletDetailUsecase({required WalletRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, WalletDetails?> call(int params) =>
      _repository.findWalletDetailById(params);
}
