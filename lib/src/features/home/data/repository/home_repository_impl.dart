import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDS _remoteDS;
  final HomeLocalDS _localDS;

  HomeRepositoryImpl({
    required HomeRemoteDS remoteDS,
    required HomeLocalDS localDs,
  })  : _remoteDS = remoteDS,
        _localDS = localDs;
  @override
  TaskEither<String, BaseResponseDTO> fetchData() => TaskEither.tryCatch(
        () async {
          final response = await _remoteDS.fetchData();
          await _localDS.persistMenus(response);
          await _localDS.persistReward(response);
          await _localDS.persistUser(response);
          await _localDS.persistWallet(response);
          return response;
        },
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, List<HomeMenu>> fetchHomeMenu() => TaskEither.tryCatch(
        () async => _localDS.fetchMenus(),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, List<MenuItem>> fetchMenuItem() => TaskEither.tryCatch(
        () => _localDS.fetchCategories(),
        (error, _) => error.toString(),
      );

  @override
  TaskEither<String, List<SubMenuItem>> fetchSubMenuItem() =>
      TaskEither.tryCatch(
        () => _localDS.fetchSubCategories(),
        (error, _) => error.toString(),
      );
}
