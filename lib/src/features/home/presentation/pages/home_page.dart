import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:imepay/src/features/home/presentation/cubit/category_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/menu_cubit.dart';
import 'package:imepay/src/features/home/presentation/cubit/subcategory_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<void> _initializationFuture;

  @override
  void initState() {
    super.initState();
    _initializationFuture = _initializeData();
  }

  Future<void> _initializeData() async {
    await context.read<HomeCubit>().fetchInitialData().then(
      (_) async {
        await Future.wait([
          context.read<WalletCubit>().getWalletDetails(),
          context.read<RewardCubit>().getRewardDetails(),
          context.read<UserCubit>().getUserDetails(),
          context.read<MenuCubit>().fetchMenu(),
          context.read<CategoryCubit>().fetchCategories(),
          context.read<SubcategoryCubit>().fetchSubCategories(),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializationFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            ),
          );
        } else {
          return Scaffold(
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
                        const Divider(),
                        const BankLinkSection(),
                        const Divider(),
                        const ServiceSection(),
                        const Divider(),
                        const RecentMoneyTransferSection(),
                        const Divider(),
                        const RecommendationSection(),
                        const Divider(),
                        const NewSection(),
                        const Divider(),
                        const PromotionSection(),
                        const Divider(),
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
          );
        }
      },
    );
  }
}
