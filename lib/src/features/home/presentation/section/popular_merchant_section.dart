import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/services/url_launcher/url_launcher_helper.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/features/home/presentation/cubit/category_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';

import '../widgets/custom_grid_view.dart';
import '../widgets/icon_text.dart';
import '../widgets/section_view.dart';

class PopularMerchantSection extends StatelessWidget {
  const PopularMerchantSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: context.watch<MenuCubit>().getMenuById(129).isEmpty
            ? ""
            : context.watch<MenuCubit>().getMenuById(129).first.categoryTitle,
        trailingCallback: () {},
        trailingText: context.watch<MenuCubit>().getMenuById(129).isEmpty
            ? ""
            : context
                .watch<CategoryCubit>()
                .getCategoriesById(129)
                .first
                .promotionalTxt,
        child: context.watch<CategoryCubit>().getCategoriesById(129).isEmpty
            ? const SizedBox.shrink()
            : CustomGridView(
                itemCount: context
                    .watch<CategoryCubit>()
                    .getCategoriesById(129)
                    .length,
                itemBuilder: (p0, p1) => GestureDetector(
                  onTap: context
                          .read<CategoryCubit>()
                          .getCategoriesById(129)[p1]
                          .redirectionValue
                          .isValidUrl()
                      ? () => UrlLauncherHelper.launchURL(
                          context,
                          context
                              .read<CategoryCubit>()
                              .getCategoriesById(129)[p1]
                              .redirectionValue)
                      : null,
                  child: IconText(
                    title: context
                        .watch<CategoryCubit>()
                        .getCategoriesById(129)[p1]
                        .title,
                    icon: Container(
                      height: context.height * 0.06,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: context
                                  .watch<CategoryCubit>()
                                  .getCategoriesById(129)[p1]
                                  .icon
                                  .isValidUrl()
                              ? DecorationImage(
                                  image: NetworkImage(
                                    context
                                        .watch<CategoryCubit>()
                                        .getCategoriesById(129)[p1]
                                        .icon,
                                  ),
                                  fit: BoxFit.contain,
                                )
                              : null),
                    ),
                  ),
                ),
              ),
      );
}
