import 'package:imepay/src/features/profile/data/datasources/local/user_dao.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/database/app_database.dart';

@injectable
class UserDaoFactory {
  final AppDatabase database;

  UserDaoFactory(this.database);

  UserDao create() => database.userDao;
}
