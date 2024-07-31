import 'package:floor/floor.dart';
import 'package:imepay/src/core/core.dart';
import 'package:injectable/injectable.dart';

import 'model.dart';

@dao
abstract class HomeMenuDao {
  @Query('SELECT * FROM HomeMenu')
  Future<List<HomeMenu>> getAllHomeMenus();

  @insert
  Future<void> insertHomeMenu(HomeMenu homeMenu);
}

@dao
abstract class MenuItemDao {
  @Query('SELECT * FROM MenuItem')
  Future<List<MenuItem>> getAllMenuItems();

  @Query('SELECT * FROM MenuItem WHERE homeMenuId = :homeMenuId')
  Future<List<MenuItem>> getMenuItemsByHomeMenuId(int homeMenuId);

  @Query(
      'SELECT id FROM MenuItem WHERE homeMenuId = :homeMenuId AND title = :title')
  Future<int?> getMenuItemId(
    int homeMenuId,
    String title,
  );

  @insert
  Future<void> insertMenuItem(MenuItem menuItem);
}

@dao
abstract class SubMenuItemDao {
  @Query('SELECT * FROM SubMenuItem')
  Future<List<SubMenuItem>> getAllSubMenuItems();

  @Query('SELECT * FROM SubMenuItem WHERE menuItemId = :menuItemId')
  Future<List<SubMenuItem>> getSubMenuItemsByMenuItemId(String menuItemId);

  @insert
  Future<void> insertSubMenuItem(SubMenuItem subMenuItem);
}

@injectable
class HomeMenuDaoFactory {
  final AppDatabase database;

  HomeMenuDaoFactory(this.database);

  HomeMenuDao create() => database.homeMenuDao;
}

@injectable
class MenuItemDaoFactory {
  final AppDatabase database;

  MenuItemDaoFactory(this.database);

  MenuItemDao create() => database.menuItemDao;
}

@injectable
class SubMenuItemDaoFactory {
  final AppDatabase database;

  SubMenuItemDaoFactory(this.database);

  SubMenuItemDao create() => database.subMenuItemDao;
}
