import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/home/presentation/cubit/category_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/subcategory_cubit.dart';
import 'package:imepay/src/features/wallet/presentation/cubit/wallet_cubit.dart';

import '../../features/profile/presentation/cubit/user_cubit.dart';
import '../../features/reward/presentation/cubit/reward_cubit.dart';

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
        BlocProvider(
          create: (context) => RewardCubit(
            getRewardDetailUsecase: locator(),
            getRewardDetailsUsecase: locator(),
            insertRewardDetailUsecase: locator(),
          ),
        ),
        BlocProvider(
          create: (context) => UserCubit(
            getUserDetailUsecase: locator(),
            getUserDetailsUsecase: locator(),
            insertUserDetailUsecase: locator(),
          ),
        ),
        BlocProvider(
          create: (context) => MenuCubit(
            locator(),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(
            locator(),
          ),
        ),
        BlocProvider(
          create: (context) => SubcategoryCubit(
            locator(),
          ),
        ),
      ],
      child: child,
    );
  }
}
