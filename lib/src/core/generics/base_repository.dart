import 'package:fpdart/fpdart.dart' show TaskEither;

abstract class BaseRepository<T> {
  TaskEither<String, List<T>> findAll();
  TaskEither<String, T?> findById(int id);
  TaskEither<String, void> insert(T params);
}
