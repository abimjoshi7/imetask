import 'dart:async';
import 'package:floor/floor.dart';
import 'package:imepay/src/person_dao.dart';
import 'package:imepay/src/person_dto.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [PersonDto])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}
