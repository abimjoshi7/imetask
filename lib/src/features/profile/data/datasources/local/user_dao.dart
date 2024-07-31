import 'package:floor/floor.dart';

import '../../../../features.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User WHERE id = :id')
  Future<UserDetailsDTO?> findUserDetailById(int id);

  @Query('SELECT * FROM User')
  Future<List<UserDetailsDTO>> findAllUserDetails();

  @Query('SELECT * FROM User')
  Stream<List<UserDetailsDTO>> findAllUserDetailsAsStream();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUserDetail(UserDetailsDTO walletDetailsDTO);
}
