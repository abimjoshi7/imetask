import 'package:floor/floor.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

@dao
abstract class HomeMenuDao {
  @Query('SELECT * FROM HomeMenu')
  Future<List<HomeMenu>> getAllHomeMenus();

  @insert
  Future<void> insertHomeMenu(HomeMenu homeMenu);
}

@injectable
class HomeMenuDaoFactory {
  final AppDatabase database;

  HomeMenuDaoFactory(this.database);

  HomeMenuDao create() => database.homeMenuDao;
}
