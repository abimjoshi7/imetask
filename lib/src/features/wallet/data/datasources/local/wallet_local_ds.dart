import 'package:imepay/src/features/wallet/data/datasources/local/wallet_dao.dart';
import 'package:imepay/src/features/wallet/data/datasources/local/wallet_doa_factory.dart';
import 'package:injectable/injectable.dart';

import '../../../../features.dart';

abstract class WalletLocalDs {
  Future<List<WalletDetailsDTO>> findAllWalletDetails();
  Future<WalletDetailsDTO?> findWalletDetailById(int id);
  Future<void> insertWalletDetail(WalletDetailsDTO walletDetailsDTO);
}

@LazySingleton(as: WalletLocalDs)
class WalletLocalDsImpl implements WalletLocalDs {
  final WalletDao walletDao;
  WalletLocalDsImpl(WalletDaoFactory daoFactory)
      : walletDao = daoFactory.create();

  @override
  Future<List<WalletDetailsDTO>> findAllWalletDetails() async =>
      walletDao.findAllWalletDetails();

  @override
  Future<WalletDetailsDTO?> findWalletDetailById(int id) async =>
      walletDao.findWalletDetailById(id);

  @override
  Future<void> insertWalletDetail(WalletDetailsDTO walletDetailsDTO) async =>
      walletDao.insertWalletDetail(walletDetailsDTO);
}
