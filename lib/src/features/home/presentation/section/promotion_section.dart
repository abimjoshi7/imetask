import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/features/home/presentation/cubit/category_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';

import '../widgets/widgets.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: context.watch<MenuCubit>().getMenuById(53).isEmpty
            ? ""
            : context.watch<MenuCubit>().getMenuById(53).first.categoryTitle,
        child: context.watch<CategoryCubit>().getCategoriesById(53).isEmpty
            ? const SizedBox.shrink()
            : CarouselSlider.builder(
                itemCount:
                    context.watch<CategoryCubit>().getCategoriesById(53).length,
                itemBuilder: (context, index, realIndex) => Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                          image: context
                                  .watch<CategoryCubit>()
                                  .getCategoriesById(53)[index]
                                  .icon
                                  .isValidUrl()
                              ? DecorationImage(
                                  image: NetworkImage(
                                    context
                                        .watch<CategoryCubit>()
                                        .getCategoriesById(53)[index]
                                        .icon,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DotIndicator(
                        currentIndex: index,
                        count: context
                            .watch<CategoryCubit>()
                            .getCategoriesById(53)
                            .length,
                      ),
                    ),
                  ],
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 3.5,
                  viewportFraction: 1,
                ),
              ),
      );
}
