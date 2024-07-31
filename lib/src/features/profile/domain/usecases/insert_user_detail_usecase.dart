import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/user_details.dart';
import '../repositories/user_repository.dart';

@lazySingleton
class InsertUserDetailUsecase extends UseCase<void, UserDetails> {
  final UserRepository _repository;

  InsertUserDetailUsecase({required UserRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, void> call(UserDetails params) =>
      _repository.insert(params);
}
