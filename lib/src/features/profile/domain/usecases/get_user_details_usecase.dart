import 'package:fpdart/fpdart.dart' show TaskEither, Unit;
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/user_details.dart';
import '../repositories/user_repository.dart';

@lazySingleton
class GetUserDetailsUsecase extends UseCase<List<UserDetails>, Unit> {
  final UserRepository _repository;

  GetUserDetailsUsecase({required UserRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, List<UserDetails>> call(Unit params) =>
      _repository.findAll();
}
