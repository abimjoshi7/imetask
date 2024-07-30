import 'package:floor/floor.dart';
import 'package:imepay/src/person_dto.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<PersonDto>> findAllPeople();

  @Query('SELECT name FROM Person')
  Stream<List<String>> findAllPeopleName();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<PersonDto?> findPersonById(int id);

  @insert
  Future<void> insertPerson(PersonDto person);
}
