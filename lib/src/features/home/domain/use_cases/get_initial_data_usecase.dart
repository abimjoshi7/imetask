import 'package:fpdart/fpdart.dart' show Unit, TaskEither;
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetInitialDataUsecase extends UseCase<BaseResponseDTO, Unit> {
  final HomeRepository _repository;

  GetInitialDataUsecase({required HomeRepository repository})
      : _repository = repository;
  @override
  TaskEither<String, BaseResponseDTO> call(Unit params) =>
      _repository.fetchData();
}
