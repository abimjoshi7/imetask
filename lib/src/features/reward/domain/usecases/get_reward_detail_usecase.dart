import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetRewardDetailUsecase extends UseCase<RewardDetails?, int> {
  final RewardRepository _repository;

  GetRewardDetailUsecase({required RewardRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, RewardDetails?> call(int params) =>
      _repository.findById(params);
}
