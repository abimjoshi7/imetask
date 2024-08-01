import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/features/home/presentation/cubit/category_cubit.dart';

class BankLinkSection extends StatelessWidget {
  const BankLinkSection({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: context.height * 0.1,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: context.watch<CategoryCubit>().getCategoriesById(13).isEmpty
                ? null
                : context
                        .watch<CategoryCubit>()
                        .getCategoriesById(13)
                        .first
                        .icon
                        .isValidUrl()
                    ? DecorationImage(
                        image: NetworkImage(
                          context
                              .watch<CategoryCubit>()
                              .getCategoriesById(13)
                              .first
                              .icon,
                        ),
                        fit: BoxFit.cover,
                      )
                    : null,
          ),
        ),
      );
}
