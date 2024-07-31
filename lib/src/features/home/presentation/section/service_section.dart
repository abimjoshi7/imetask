import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/core/utils/color_palette.dart';
import 'package:imepay/src/features/features.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';

import '../widgets/widgets.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: context.watch<MenuCubit>().getMenuById(21).first.categoryTitle,
        child: CustomGridView(
          aspectRatio: 1.2,
          itemCount: context.watch<MenuCubit>().getCategoriesById(21).length,
          itemBuilder: (p0, p1) => IconText(
            textColor: Colors.black,
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    kClrTopGradnt,
                    kClrTopGradnt,
                    kClrBtmGradnt,
                  ],
                ),
              ),
              child: context
                      .watch<MenuCubit>()
                      .getCategoriesById(21)[p1]
                      .icon
                      .isValidUrl()
                  ? Image.network(
                      context.watch<MenuCubit>().getCategoriesById(21)[p1].icon,
                    )
                  : const Icon(Icons.question_mark_rounded),
            ),
            title: context.watch<MenuCubit>().getCategoriesById(21)[p1].title,
          ),
        ),
      );
}
