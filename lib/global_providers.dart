import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:imepay/src/features/wallet/presentation/cubit/wallet_cubit.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            getInitialDataUsecase: locator(),
          ),
        ),
        BlocProvider(
          create: (context) => WalletCubit(
            getWalletDetailUsecase: locator(),
            getWalletDetailsUsecase: locator(),
            insertWalletDetailUsecase: locator(),
          ),
        ),
      ],
      child: child,
    );
  }
}
