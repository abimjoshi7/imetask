import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:imepay/src/features/features.dart';

abstract class HomeRepository {
  TaskEither<String, BaseResponseDTO> fetchData();
  TaskEither<String, List<HomeMenu>> fetchHomeMenu();
  TaskEither<String, List<MenuItem>> fetchMenuItem();
  TaskEither<String, List<SubMenuItem>> fetchSubMenuItem();
}
