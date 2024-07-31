import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/utils/color_palette.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';

import '../widgets/widgets.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: context.watch<MenuCubit>().getMenuById(44).first.categoryTitle,
        child: CustomGridView(
          itemCount: context.watch<MenuCubit>().getCategoriesById(44).length,
          itemBuilder: (p0, p1) => IconText(
            icon: Container(
              height: context.height * 0.06,
              width: context.width * 0.2,
              decoration: BoxDecoration(
                  image: context
                          .watch<MenuCubit>()
                          .getCategoriesById(44)[p1]
                          .icon
                          .isValidUrl()
                      ? DecorationImage(
                          image: NetworkImage(
                            context
                                .watch<MenuCubit>()
                                .getCategoriesById(44)[p1]
                                .icon,
                          ),
                          fit: BoxFit.cover,
                        )
                      : null),
            ),
            title: context.watch<MenuCubit>().getCategoriesById(44)[p1].title,
          ),
        ),
      );
}
