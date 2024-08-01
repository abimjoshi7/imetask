import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:imepay/src/features/home/presentation/cubit/category_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/subcategory_cubit.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: context.watch<MenuCubit>().getMenuById(21).isEmpty
            ? ""
            : context.watch<MenuCubit>().getMenuById(21).first.categoryTitle,
        child: context.watch<CategoryCubit>().getCategoriesById(21).isEmpty
            ? const SizedBox.shrink()
            : CustomGridView(
                aspectRatio: 1.2,
                itemCount:
                    context.watch<CategoryCubit>().getCategoriesById(21).length,
                itemBuilder: (p0, p1) => GestureDetector(
                  onTap: () => context
                          .read<SubcategoryCubit>()
                          .getSubCategoriesById(context
                                  .read<CategoryCubit>()
                                  .getCategoriesById(21)[p1]
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
                                        .getCategoriesById(21)[p1]
                                        .id ??
                                    0)
                                .first
                                .title,
                            builder: (p0) => context
                                    .read<SubcategoryCubit>()
                                    .getSubCategoriesById(context
                                            .read<CategoryCubit>()
                                            .getCategoriesById(21)[p1]
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
                                                            21)[p1]
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
                                                                      21)[p1]
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
                                                            21)[p1]
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
                                        .getCategoriesById(21)[p1]
                                        .id ??
                                    0)
                                .length,
                          ),
                        ),
                  child: IconText(
                    icon: Container(
                      height: context.height * 0.075,
                      width: context.width * 0.14,
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
                              .watch<CategoryCubit>()
                              .getCategoriesById(21)[p1]
                              .icon
                              .isValidUrl()
                          ? Image.network(
                              context
                                  .watch<CategoryCubit>()
                                  .getCategoriesById(21)[p1]
                                  .icon,
                            )
                          : const Icon(Icons.question_mark_rounded),
                    ),
                    title: context
                        .watch<CategoryCubit>()
                        .getCategoriesById(21)[p1]
                        .title,
                  ),
                ),
              ),
      );
}
