import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:imepay/src/core/utils/color_palette.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/features/home/presentation/cubit/category_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';
import 'package:imepay/src/features/home/presentation/widgets/widgets.dart';

const itemCount = 4;

class QuickLinkSection extends StatelessWidget {
  const QuickLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount,
        (index) => SizedBox(
          width: context.width / 4,
          child: GestureDetector(
            onTap: switch (index) {
              1 => () => context.showBottomSheet(
                    const SendMoneySheet(),
                  ),
              3 => () => context.showBottomSheet(
                    const AccountOptionSheet(),
                  ),
              _ => null,
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 11,
              ),
              child: IconText(
                icon: CircleAvatar(
                  backgroundColor: kClrRed,
                  foregroundColor: Colors.white,
                  child: quickActionItems.values.elementAt(index),
                ),
                title: quickActionItems.keys.elementAt(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AccountOptionSheet extends StatelessWidget {
  const AccountOptionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: context.watch<MenuCubit>().getMenuById(17).isEmpty
          ? ""
          : context.watch<MenuCubit>().getMenuById(17).first.categoryTitle,
      builder: (p0) =>
          context.watch<CategoryCubit>().getCategoriesById(17).isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      context
                              .watch<CategoryCubit>()
                              .getCategoriesById(18)[p0]
                              .icon
                              .isValidUrl()
                          ? Container(
                              height: context.height * 0.04,
                              width: context.width * 0.08,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: kClrBlack,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    context
                                        .watch<CategoryCubit>()
                                        .getCategoriesById(17)[p0]
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
                              .watch<CategoryCubit>()
                              .getCategoriesById(17)[p0]
                              .title,
                          style: context.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
      count: context.watch<CategoryCubit>().getCategoriesById(17).length,
    );
  }
}

class SendMoneySheet extends StatelessWidget {
  const SendMoneySheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: context.watch<MenuCubit>().getMenuById(18).isEmpty
          ? ""
          : context.watch<MenuCubit>().getMenuById(18).first.categoryTitle,
      builder: (p0) =>
          context.watch<CategoryCubit>().getCategoriesById(18).isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      context
                              .watch<CategoryCubit>()
                              .getCategoriesById(18)[p0]
                              .icon
                              .isValidUrl()
                          ? Container(
                              height: context.height * 0.04,
                              width: context.width * 0.08,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: kClrBlack,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    context
                                        .watch<CategoryCubit>()
                                        .getCategoriesById(18)[p0]
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
                              .watch<CategoryCubit>()
                              .getCategoriesById(18)[p0]
                              .title,
                          style: context.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
      count: context.watch<CategoryCubit>().getCategoriesById(18).length,
    );
  }
}

Map<String, Icon> quickActionItems = {
  "Add Money": const Icon(
    Icons.add_rounded,
  ),
  "Send Money": const Icon(
    Icons.send_rounded,
  ),
  "Receive Remittanc": const Icon(
    Icons.payments_rounded,
  ),
  "Banking Services": const Icon(
    Icons.account_balance_rounded,
  ),
};
