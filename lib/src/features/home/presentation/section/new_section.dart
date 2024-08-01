import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:imepay/src/features/home/presentation/cubit/category_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/subcategory_cubit.dart';

class NewSection extends StatelessWidget {
  const NewSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: context.watch<MenuCubit>().getMenuById(51).isEmpty
            ? ""
            : context.watch<MenuCubit>().getMenuById(51).first.categoryTitle,
        child: context.watch<CategoryCubit>().getCategoriesById(51).isEmpty
            ? const SizedBox.shrink()
            : CustomGridView(
                aspectRatio: 1.7,
                itemCount:
                    context.watch<CategoryCubit>().getCategoriesById(51).length,
                itemBuilder: (p0, p1) => GestureDetector(
                  onTap: () => context
                          .read<SubcategoryCubit>()
                          .getSubCategoriesById(context
                                  .read<CategoryCubit>()
                                  .getCategoriesById(51)[p1]
                                  .id ??
                              0)
                          .isEmpty
                      ? null
                      : context.showBottomSheet(
                          CustomBottomSheet(
                            title: context
                                .read<SubcategoryCubit>()
                                .getSubCategoriesById(context
                                        .read<CategoryCubit>()
                                        .getCategoriesById(51)[p1]
                                        .id ??
                                    0)
                                .first
                                .title,
                            builder: (p0) => context
                                    .read<SubcategoryCubit>()
                                    .getSubCategoriesById(context
                                            .read<CategoryCubit>()
                                            .getCategoriesById(51)[p1]
                                            .id ??
                                        0)
                                    .isEmpty
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Row(
                                      children: [
                                        context
                                                .read<SubcategoryCubit>()
                                                .getSubCategoriesById(context
                                                        .read<CategoryCubit>()
                                                        .getCategoriesById(
                                                            51)[p1]
                                                        .id ??
                                                    0)[p0]
                                                .icon
                                                .isValidUrl()
                                            ? Container(
                                                height: context.height * 0.04,
                                                width: context.width * 0.08,
                                                padding:
                                                    const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  color: kClrBlack,
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      context
                                                          .read<
                                                              SubcategoryCubit>()
                                                          .getSubCategoriesById(context
                                                                  .read<
                                                                      CategoryCubit>()
                                                                  .getCategoriesById(
                                                                      51)[p1]
                                                                  .id ??
                                                              0)[p0]
                                                          .icon,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            context
                                                .read<SubcategoryCubit>()
                                                .getSubCategoriesById(context
                                                        .read<CategoryCubit>()
                                                        .getCategoriesById(
                                                            51)[p1]
                                                        .id ??
                                                    0)[p0]
                                                .title,
                                            style: context.labelLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            count: context
                                .read<SubcategoryCubit>()
                                .getSubCategoriesById(context
                                        .read<CategoryCubit>()
                                        .getCategoriesById(51)[p1]
                                        .id ??
                                    0)
                                .length,
                          ),
                        ),
                  child: IconText(
                    title: context
                        .watch<CategoryCubit>()
                        .getCategoriesById(51)[p1]
                        .title,
                    icon: const CircleAvatar(),
                  ),
                ),
              ),
      );
}
