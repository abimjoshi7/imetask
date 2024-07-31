import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeHelper {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => previous != current,
      listener: onDataFetched,
      child: Scaffold(
        backgroundColor: kClrBg,
        appBar: const HomeAppBar(),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: context.read<HomeCubit>().fetchInitialData,
            child: Stack(
              children: [
                ListView(
                  children: [
                    const BannerSection(),
                    const QuickLinkSection(),
                    const BankLinkSection(),
                    const ServiceSection(),
                    const PromotionSection(),
                    const RecommendationSection(),
                    const NewSection(),
                    const CableCarSection(),
                    const PopularMerchantSection(),
                    SizedBox(
                      height: context.height * 0.08 + 32,
                    )
                  ],
                ),
                const Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomBar(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
                UserSuccess(:final userDetails) =>
                  userDetails.first.userFullName.trim().split(" ").first,
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
          onPressed: () async {},
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

mixin HomeHelper {
  void onDataFetched(BuildContext context, HomeState state) async {
    await context.read<WalletCubit>().getWalletDetails();
    await context.read<RewardCubit>().getRewardDetails();
    await context.read<UserCubit>().getUserDetails();
    await context.read<MenuCubit>().fetchMenu();
    await context.read<MenuCubit>().fetchCategories();
    await context.read<MenuCubit>().fetchCategories();
    if (state is HomeFailure) context.showSnackBar(state.errorMsg);
  }
}
