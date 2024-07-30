import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/home/presentation/cubit/home_cubit.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            locator(),
          ),
        )
      ],
      child: child,
    );
  }
}
