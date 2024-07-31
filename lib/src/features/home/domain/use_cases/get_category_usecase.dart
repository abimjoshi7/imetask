import 'package:fpdart/fpdart.dart' show TaskEither, Unit;
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoryUsecase extends UseCase<List<MenuItem>, Unit> {
  final HomeRepository _repository;

  GetCategoryUsecase({required HomeRepository repository})
      : _repository = repository;

  @override
  TaskEither<String, List<MenuItem>> call(Unit params) =>
      _repository.fetchMenuItem();
}
