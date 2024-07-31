import 'package:injectable/injectable.dart';

import '../../../../../core/services/database/app_database.dart';
import '../datasources.dart';

@injectable
class RewardDaoFactory {
  final AppDatabase database;

  RewardDaoFactory(this.database);

  RewardDao create() => database.rewardDao;
}
