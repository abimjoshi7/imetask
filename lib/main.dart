import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/dependency_injection/di.dart';

import 'src/core/utils/app_bloc_observer.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

  configureDependencies();

  runApp(const ImePayApp());
}
