import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imepay/src/core/services/database/database.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'initialize',
)
Future<void> configureDependencies() async => locator.initialize();

@module
abstract class CoreModule {
  @preResolve
  Future<AppDatabase> get database async =>
      $FloorAppDatabase.databaseBuilder('app_database.db').addMigrations(
        [],
      ).build();

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
