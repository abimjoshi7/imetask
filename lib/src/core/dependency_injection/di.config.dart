// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:imepay/src/core/core.dart' as _i229;
import 'package:imepay/src/core/dependency_injection/di.dart' as _i81;
import 'package:imepay/src/core/services/api/api_client.dart' as _i923;
import 'package:imepay/src/core/services/api/network_info.dart' as _i467;
import 'package:imepay/src/core/services/database/database.dart' as _i316;
import 'package:imepay/src/features/features.dart' as _i159;
import 'package:imepay/src/features/home/data/datasources/datasources.dart'
    as _i104;
import 'package:imepay/src/features/home/data/datasources/remote/remote.dart'
    as _i848;
import 'package:imepay/src/features/home/data/repository/repository.dart'
    as _i655;
import 'package:imepay/src/features/home/domain/use_cases/get_initial_data_usecase.dart'
    as _i780;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> initialize({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    await gh.factoryAsync<_i316.AppDatabase>(
      () => coreModule.initializeDatabase(),
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => coreModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => coreModule.connectivity);
    gh.lazySingleton<_i923.ApiClient>(
        () => _i923.ApiClient(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i848.HomeRemoteDS>(
        () => _i848.HomeRemoteDSImpl(client: gh<_i229.ApiClient>()));
    gh.lazySingleton<_i467.NetworkInfo>(
        () => _i467.NetworkInfoImpl(connectivity: gh<_i895.Connectivity>()));
    gh.lazySingleton<_i159.HomeRepository>(
        () => _i655.HomeRepositoryImpl(remoteDS: gh<_i104.HomeRemoteDS>()));
    gh.factory<_i780.GetInitialDataUsecase>(() =>
        _i780.GetInitialDataUsecase(repository: gh<_i159.HomeRepository>()));
    return this;
  }
}

class _$CoreModule extends _i81.CoreModule {}
