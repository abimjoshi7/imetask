import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final int personId;
  final String personName;

  const Person({
    required this.personId,
    required this.personName,
  });

  @override
  List<Object> get props => [personId, personName];
}
