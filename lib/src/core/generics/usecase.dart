import 'package:fpdart/fpdart.dart' show TaskEither;

abstract class UseCase<T, P> {
  TaskEither<String, T> call(P params);
}
