import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/user_details.dart';
import '../repositories/user_repository.dart';

@lazySingleton
class GetUserDetailUsecase extends UseCase<UserDetails?, int> {
  final UserRepository _repository;

  GetUserDetailUsecase({required UserRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, UserDetails?> call(int params) =>
      _repository.findById(params);
}
