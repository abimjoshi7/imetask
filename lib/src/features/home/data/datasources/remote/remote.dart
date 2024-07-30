import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDS {
  Future<BaseResponseDTO> fetchData();
}

@LazySingleton(as: HomeRemoteDS)
class HomeRemoteDSImpl implements HomeRemoteDS {
  final ApiClient _client;

  HomeRemoteDSImpl({required ApiClient client}) : _client = client;
  @override
  Future<BaseResponseDTO> fetchData() async {
    try {
      return await _client
          .get(
            path: Endpoints.path,
          )
          .then(
            (value) => BaseResponseDTO.fromJson(value.data["data"]),
          );
    } catch (e) {
      rethrow;
    }
  }
}
