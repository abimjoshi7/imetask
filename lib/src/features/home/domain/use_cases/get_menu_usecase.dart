import 'package:fpdart/fpdart.dart' show TaskEither, Unit;
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMenuUsecase extends UseCase<List<HomeMenu>, Unit> {
  final HomeRepository _repository;

  GetMenuUsecase({required HomeRepository repository})
      : _repository = repository;

  @override
  TaskEither<String, List<HomeMenu>> call(Unit params) =>
      _repository.fetchHomeMenu();
}
