import 'package:fpdart/fpdart.dart' show TaskEither, Unit;
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoryUsecase extends UseCase<List<SubMenuItem>, Unit> {
  final HomeRepository _repository;

  GetSubCategoryUsecase({required HomeRepository repository})
      : _repository = repository;

  @override
  TaskEither<String, List<SubMenuItem>> call(Unit params) =>
      _repository.fetchSubMenuItem();
}
