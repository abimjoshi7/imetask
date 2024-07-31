import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:injectable/injectable.dart';

import '../../../features.dart';
import '../../domain/domain.dart';
import '../datasources/local/user_local_ds.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserLocalDS _userLocalDs;

  UserRepositoryImpl({required UserLocalDS userLocalDs})
      : _userLocalDs = userLocalDs;

  @override
  TaskEither<String, List<UserDetails>> findAll() => TaskEither.tryCatch(
        () async => _userLocalDs.findAllUserDetails(),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, UserDetails?> findById(int id) => TaskEither.tryCatch(
        () async => _userLocalDs.findUserDetailById(id),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, void> insert(UserDetails params) => TaskEither.tryCatch(
        () => _userLocalDs.insertUserDetail(
          UserDetailsDTO.fromJson(
            params.toMap(),
          ),
        ),
        (error, _) => error.toString(),
      );
}
