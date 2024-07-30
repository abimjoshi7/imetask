import 'package:fpdart/src/task_either.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

import '../datasources/datasources.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDS _remoteDS;

  HomeRepositoryImpl({required HomeRemoteDS remoteDS}) : _remoteDS = remoteDS;
  @override
  TaskEither<String, BaseResponseDTO> fetchData() => TaskEither.tryCatch(
        () async => _remoteDS.fetchData(),
        (error, _) => error.toString(),
      );
}
