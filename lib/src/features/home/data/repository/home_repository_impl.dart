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
          final response = await _remoteDS.fetchData().then(
            (r) async {
              await _localDS.persistMenus(r);
              await _localDS.persistReward(r);
              await _localDS.persistUser(r);
              await _localDS.persistWallet(r);
            },
          );

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
