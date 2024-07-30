import 'package:floor/floor.dart';
import 'package:imepay/src/person.dart';

@Entity(tableName: 'Person')
class PersonDto extends Person {
  const PersonDto({
    required this.id,
    required this.name,
  }) : super(
          personId: id,
          personName: name,
        );

  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
}
