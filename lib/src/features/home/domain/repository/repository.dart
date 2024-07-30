import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/features/features.dart';

abstract class HomeRepository {
  TaskEither<String, BaseResponseDTO> fetchData();
}
