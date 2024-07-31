import 'package:injectable/injectable.dart';

import '../../../../features.dart';

abstract class RewardLocalDS {
  Future<List<RewardDetailsDTO>> findAllRewardDetails();
  Future<RewardDetailsDTO?> findRewardDetailById(int id);
  Future<void> insertRewardDetail(RewardDetailsDTO walletDetailsDTO);
}

@LazySingleton(as: RewardLocalDS)
class RewardLocalDsImpl implements RewardLocalDS {
  final RewardDao rewardDao;
  RewardLocalDsImpl(RewardDaoFactory daoFactory)
      : rewardDao = daoFactory.create();

  @override
  Future<List<RewardDetailsDTO>> findAllRewardDetails() async =>
      rewardDao.findAllRewardDetails();

  @override
  Future<RewardDetailsDTO?> findRewardDetailById(int id) async =>
      rewardDao.findRewardDetailById(id);

  @override
  Future<void> insertRewardDetail(RewardDetailsDTO walletDetailsDTO) async =>
      rewardDao.insertRewardDetail(walletDetailsDTO);
}
