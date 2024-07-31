import 'package:floor/floor.dart';

import '../../../../features.dart';

@dao
abstract class RewardDao {
  @Query('SELECT * FROM Reward WHERE id = :id')
  Future<RewardDetailsDTO?> findRewardDetailById(int id);

  @Query('SELECT * FROM Reward')
  Future<List<RewardDetailsDTO>> findAllRewardDetails();

  @Query('SELECT * FROM Reward')
  Stream<List<RewardDetailsDTO>> findAllRewardDetailsAsStream();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertRewardDetail(RewardDetailsDTO walletDetailsDTO);
}
