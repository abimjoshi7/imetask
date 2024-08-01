import 'package:floor/floor.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

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

@injectable
class MenuItemDaoFactory {
  final AppDatabase database;

  MenuItemDaoFactory(this.database);

  MenuItemDao create() => database.menuItemDao;
}
