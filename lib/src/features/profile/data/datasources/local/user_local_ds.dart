import 'package:injectable/injectable.dart';

import '../../../../features.dart';

abstract class UserLocalDS {
  Future<List<UserDetailsDTO>> findAllUserDetails();
  Future<UserDetailsDTO?> findUserDetailById(int id);
  Future<void> insertUserDetail(UserDetailsDTO userDetailsDTO);
}

@LazySingleton(as: UserLocalDS)
class UserLocalDsImpl implements UserLocalDS {
  final UserDao rewardDao;
  UserLocalDsImpl(UserDaoFactory daoFactory) : rewardDao = daoFactory.create();

  @override
  Future<List<UserDetailsDTO>> findAllUserDetails() async =>
      rewardDao.findAllUserDetails();

  @override
  Future<UserDetailsDTO?> findUserDetailById(int id) async =>
      rewardDao.findUserDetailById(id);

  @override
  Future<void> insertUserDetail(UserDetailsDTO userDetailsDTO) async =>
      rewardDao.insertUserDetail(userDetailsDTO);
}
