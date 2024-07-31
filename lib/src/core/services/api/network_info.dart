import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<ConnectivityResult> get networkStatusStream;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;
  final _networkStatusController = StreamController<ConnectivityResult>();

  NetworkInfoImpl({required Connectivity connectivity})
      : _connectivity = connectivity {
    _initialize();
  }

  void _initialize() {
    _connectivity.onConnectivityChanged.listen((result) {
      _networkStatusController.add(result.first);
    });
  }

  @override
  Future<bool> get isConnected async => await _connectivity
      .checkConnectivity()
      .then((value) => value.first != ConnectivityResult.none);

  @override
  Stream<ConnectivityResult> get networkStatusStream =>
      _networkStatusController.stream;

  void dispose() {
    _networkStatusController.close();
  }
}

class NetworkStatusCubit extends Cubit<ConnectivityResult> {
  final NetworkInfo _networkInfo;

  NetworkStatusCubit({required NetworkInfo networkInfo})
      : _networkInfo = networkInfo,
        super(ConnectivityResult.none) {
    _networkInfo.networkStatusStream.listen((result) {
      emit(result);
    });
  }

  bool get isConnected => state != ConnectivityResult.none;
}
