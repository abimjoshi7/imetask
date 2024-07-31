import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class InsertRewardDetailUsecase extends UseCase<void, RewardDetails> {
  final RewardRepository _repository;

  InsertRewardDetailUsecase({required RewardRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, void> call(RewardDetails params) =>
      _repository.insert(params);
}
