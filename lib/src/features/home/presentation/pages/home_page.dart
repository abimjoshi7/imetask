import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
}
