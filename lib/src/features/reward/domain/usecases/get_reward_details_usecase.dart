import 'package:fpdart/fpdart.dart' show TaskEither, Unit;
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetRewardDetailsUsecase extends UseCase<List<RewardDetails>, Unit> {
  final RewardRepository _repository;

  GetRewardDetailsUsecase({required RewardRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, List<RewardDetails>> call(Unit params) =>
      _repository.findAll();
}
