import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/features/reward/data/datasources/datasources.dart';
import 'package:injectable/injectable.dart';

import '../../../features.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

@LazySingleton(as: RewardRepository)
class RewardRepositoryImpl implements RewardRepository {
  final RewardLocalDS _rewardLocalDs;

  RewardRepositoryImpl({required RewardLocalDS rewardLocalDs})
      : _rewardLocalDs = rewardLocalDs;

  @override
  TaskEither<String, List<RewardDetails>> findAll() => TaskEither.tryCatch(
        () async => _rewardLocalDs.findAllRewardDetails(),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, RewardDetails?> findById(int id) => TaskEither.tryCatch(
        () async => _rewardLocalDs.findRewardDetailById(id),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, void> insert(RewardDetails params) => TaskEither.tryCatch(
        () => _rewardLocalDs.insertRewardDetail(
          RewardDetailsDTO.fromJson(
            params.toMap(),
          ),
        ),
        (error, _) => error.toString(),
      );
}
