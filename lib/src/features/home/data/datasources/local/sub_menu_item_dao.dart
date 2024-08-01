import 'package:floor/floor.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:injectable/injectable.dart';

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
class SubMenuItemDaoFactory {
  final AppDatabase database;

  SubMenuItemDaoFactory(this.database);

  SubMenuItemDao create() => database.subMenuItemDao;
}
