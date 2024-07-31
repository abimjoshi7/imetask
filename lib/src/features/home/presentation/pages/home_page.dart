import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';
import 'package:imepay/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:imepay/src/features/home/presentation/presentation.dart';
import 'package:imepay/src/features/wallet/presentation/cubit/wallet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kClrBg,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Hi, User",
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
              // context.read<WalletCubit>().insertWalletDetail(
              //       WalletDetails(
              //         memberType: "memberType",
              //         amount: "amount",
              //         interestAmount: "interestAmount",
              //         totalCreditPoints: "totalCreditPoints",
              //         interestDate: DateTime.now(),
              //         status: "status",
              //       ),
              //     );

              // if (context.read<HomeCubit>().state is HomeSuccess) {
              //   final data = context.read<HomeCubit>().state as HomeSuccess;
              //   print(data.data.responseData);
              // }
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          // context.read<HomeCubit>().fetchInitialData,
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
    );
  }
}

mixin HomeHelper {
  void onDataFetched(BuildContext context, HomeState state) {
    if (state is HomeSuccess) {
      context
          .read<WalletCubit>()
          .insertWalletDetail(state.data.responseData.walletDetails);
    }
    if (state is HomeFailure) context.showSnackBar(state.errorMsg);
  }
}
