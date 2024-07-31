import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

abstract class BaseObject extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int id;
  const BaseObject({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
