import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';

import '../widgets/widgets.dart';

class RecentMoneyTransferSection extends StatelessWidget {
  const RecentMoneyTransferSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: context.read<MenuCubit>().getMenuById(32).isEmpty
            ? ""
            : context.watch<MenuCubit>().getMenuById(32).first.categoryTitle,
        child: const SizedBox.shrink(),
      );
}
