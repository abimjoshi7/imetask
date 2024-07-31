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
import 'package:imepay/src/core/services/database/app_database.dart' as _i136;
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
import 'package:imepay/src/features/profile/data/datasources/local/user_doa_factory.dart'
    as _i334;
import 'package:imepay/src/features/profile/data/datasources/local/user_local_ds.dart'
    as _i1051;
import 'package:imepay/src/features/profile/data/repositories/user_repository_impl.dart'
    as _i297;
import 'package:imepay/src/features/profile/domain/domain.dart' as _i82;
import 'package:imepay/src/features/profile/domain/repositories/user_repository.dart'
    as _i671;
import 'package:imepay/src/features/profile/domain/usecases/get_user_detail_usecase.dart'
    as _i717;
import 'package:imepay/src/features/profile/domain/usecases/get_user_details_usecase.dart'
    as _i133;
import 'package:imepay/src/features/profile/domain/usecases/insert_user_detail_usecase.dart'
    as _i522;
import 'package:imepay/src/features/reward/data/datasources/datasources.dart'
    as _i1044;
import 'package:imepay/src/features/reward/data/datasources/local/reward_doa_factory.dart'
    as _i1005;
import 'package:imepay/src/features/reward/data/datasources/local/reward_local_ds.dart'
    as _i1039;
import 'package:imepay/src/features/reward/data/repositories/reward_repository_impl.dart'
    as _i977;
import 'package:imepay/src/features/reward/domain/repositories/repositories.dart'
    as _i1047;
import 'package:imepay/src/features/reward/domain/usecases/get_reward_detail_usecase.dart'
    as _i796;
import 'package:imepay/src/features/reward/domain/usecases/get_reward_details_usecase.dart'
    as _i380;
import 'package:imepay/src/features/reward/domain/usecases/insert_reward_detail_usecase.dart'
    as _i145;
import 'package:imepay/src/features/wallet/data/datasources/local/wallet_doa_factory.dart'
    as _i67;
import 'package:imepay/src/features/wallet/data/datasources/local/wallet_local_ds.dart'
    as _i70;
import 'package:imepay/src/features/wallet/data/repositories/wallet_repository_impl.dart'
    as _i289;
import 'package:imepay/src/features/wallet/domain/usecases/get_wallet_detail_usecase.dart'
    as _i395;
import 'package:imepay/src/features/wallet/domain/usecases/get_wallet_details_usecase.dart'
    as _i403;
import 'package:imepay/src/features/wallet/domain/usecases/insert_wallet_detail_usecase.dart'
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
      () => coreModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => coreModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => coreModule.connectivity);
    gh.lazySingleton<_i923.ApiClient>(
        () => _i923.ApiClient(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i848.HomeRemoteDS>(
        () => _i848.HomeRemoteDSImpl(client: gh<_i229.ApiClient>()));
    gh.factory<_i67.WalletDaoFactory>(
        () => _i67.WalletDaoFactory(gh<_i136.AppDatabase>()));
    gh.factory<_i1005.RewardDaoFactory>(
        () => _i1005.RewardDaoFactory(gh<_i136.AppDatabase>()));
    gh.factory<_i334.UserDaoFactory>(
        () => _i334.UserDaoFactory(gh<_i136.AppDatabase>()));
    gh.lazySingleton<_i467.NetworkInfo>(
        () => _i467.NetworkInfoImpl(connectivity: gh<_i895.Connectivity>()));
    gh.lazySingleton<_i1051.UserLocalDS>(
        () => _i1051.UserLocalDsImpl(gh<_i334.UserDaoFactory>()));
    gh.lazySingleton<_i70.WalletLocalDs>(
        () => _i70.WalletLocalDsImpl(gh<_i159.WalletDaoFactory>()));
    gh.lazySingleton<_i1039.RewardLocalDS>(
        () => _i1039.RewardLocalDsImpl(gh<_i1044.RewardDaoFactory>()));
    gh.lazySingleton<_i82.UserRepository>(
        () => _i297.UserRepositoryImpl(userLocalDs: gh<_i1051.UserLocalDS>()));
    gh.lazySingleton<_i159.HomeRepository>(
        () => _i655.HomeRepositoryImpl(remoteDS: gh<_i104.HomeRemoteDS>()));
    gh.lazySingleton<_i159.WalletRepository>(() =>
        _i289.WalletRepositoryImpl(walletLocalDs: gh<_i159.WalletLocalDs>()));
    gh.lazySingleton<_i717.GetUserDetailUsecase>(() =>
        _i717.GetUserDetailUsecase(repository: gh<_i671.UserRepository>()));
    gh.lazySingleton<_i133.GetUserDetailsUsecase>(() =>
        _i133.GetUserDetailsUsecase(repository: gh<_i671.UserRepository>()));
    gh.lazySingleton<_i522.InsertUserDetailUsecase>(() =>
        _i522.InsertUserDetailUsecase(repository: gh<_i671.UserRepository>()));
    gh.lazySingleton<_i1047.RewardRepository>(() =>
        _i977.RewardRepositoryImpl(rewardLocalDs: gh<_i1044.RewardLocalDS>()));
    gh.lazySingleton<_i403.GetWalletDetailsUsecase>(() =>
        _i403.GetWalletDetailsUsecase(
            repository: gh<_i159.WalletRepository>()));
    gh.lazySingleton<_i395.GetWalletDetailUsecase>(() =>
        _i395.GetWalletDetailUsecase(repository: gh<_i159.WalletRepository>()));
    gh.lazySingleton<_i780.InsertWalletDetailUsecase>(() =>
        _i780.InsertWalletDetailUsecase(
            repository: gh<_i159.WalletRepository>()));
    gh.factory<_i780.GetInitialDataUsecase>(() =>
        _i780.GetInitialDataUsecase(repository: gh<_i159.HomeRepository>()));
    gh.lazySingleton<_i145.InsertRewardDetailUsecase>(() =>
        _i145.InsertRewardDetailUsecase(
            repository: gh<_i1047.RewardRepository>()));
    gh.lazySingleton<_i380.GetRewardDetailsUsecase>(() =>
        _i380.GetRewardDetailsUsecase(
            repository: gh<_i1047.RewardRepository>()));
    gh.lazySingleton<_i796.GetRewardDetailUsecase>(() =>
        _i796.GetRewardDetailUsecase(
            repository: gh<_i1047.RewardRepository>()));
    return this;
  }
}

class _$CoreModule extends _i81.CoreModule {}
