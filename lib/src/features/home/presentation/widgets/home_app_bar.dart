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
          onPressed: switch (index) {
            0 => () => showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                ),
            _ => null,
          },
          icon: Icon(
            switch (index) {
              0 => Icons.search_rounded,
              1 => Icons.favorite_outlined,
              _ => Icons.notifications_rounded,
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [];

  @override
  Widget? buildLeading(BuildContext context) => null;

  @override
  Widget buildResults(BuildContext context) => const SizedBox.shrink();

  @override
  Widget buildSuggestions(BuildContext context) => const SizedBox.shrink();
}
