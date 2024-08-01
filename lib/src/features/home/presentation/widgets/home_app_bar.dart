import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const CircleAvatar(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Hi, ${switch (context.watch<UserCubit>().state) {
                UserSuccess(:final userDetails) => userDetails.isEmpty
                    ? "User"
                    : userDetails.first.userFullName.trim().split(" ").first,
                _ => "User",
              }}",
              style: context.titleMedium,
            ),
          ),
        ],
      ),
      actions: List.generate(
        3,
        (index) => IconButton(
          onPressed: () async {
            context.read<WalletCubit>().getWalletDetails();
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
