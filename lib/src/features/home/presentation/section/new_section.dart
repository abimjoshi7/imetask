import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';

import '../widgets/custom_grid_view.dart';
import '../widgets/icon_text.dart';
import '../widgets/section_view.dart';

class NewSection extends StatelessWidget {
  const NewSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: context.watch<MenuCubit>().getMenuById(51).first.categoryTitle,
        child: CustomGridView(
          itemCount: context.watch<MenuCubit>().getCategoriesById(51).length,
          itemBuilder: (p0, p1) => IconText(
            title: context.watch<MenuCubit>().getCategoriesById(51)[p1].title,
            icon: Container(
              height: 40,
              width: 40,
              color: Colors.amber,
              child: const Center(child: Text("data")),
            ),
          ),
        ),
      );
}
