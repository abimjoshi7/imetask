import 'package:floor/floor.dart';

import '../../../../features.dart';

@dao
abstract class WalletDao {
  @Query('SELECT * FROM Wallet WHERE id = :id')
  Future<WalletDetailsDTO?> findWalletDetailById(int id);

  @Query('SELECT * FROM Wallet')
  Future<List<WalletDetailsDTO>> findAllWalletDetails();

  @Query('SELECT * FROM Wallet')
  Stream<List<WalletDetailsDTO>> findAllWalletDetailsAsStream();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertWalletDetail(WalletDetailsDTO walletDetailsDTO);
}
