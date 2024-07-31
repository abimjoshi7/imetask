import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/core/utils/color_palette.dart';
import 'package:imepay/src/features/features.dart';
import 'package:imepay/src/features/wallet/wallet.dart';

class WalletInfoCard extends StatelessWidget {
  const WalletInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Super Wallet Account Rs. ",
                      style: context.labelSmall?.copyWith(
                        color: kClrDisabled,
                      ),
                    ),
                    const Icon(
                      Icons.visibility,
                      size: 16,
                      color: kClrDisabled,
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text.rich(
                  TextSpan(
                    text: switch (context.watch<WalletCubit>().state) {
                      WalletSuccess(:final walletDetails) =>
                        walletDetails.first.amount,
                      _ => "0",
                    },
                    style: context.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    // children: [
                    //   TextSpan(
                    //     text: ".00",
                    //     style: context.titleMedium,
                    //   ),
                    // ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Interest Earned ",
                      style: context.labelSmall?.copyWith(
                        color: kClrDisabled,
                      ),
                    ),
                    const Icon(
                      Icons.info_rounded,
                      size: 16,
                      color: kClrDisabled,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text.rich(
                  TextSpan(
                    text: "+${switch (context.watch<WalletCubit>().state) {
                      WalletSuccess(:final walletDetails) =>
                        walletDetails.first.interestAmount,
                      _ => "0"
                    }}",
                    style: context.titleSmall?.copyWith(
                      color: kClrGreen,
                    ),
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kClrGreen,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              " @3.05% ",
                              style: context.titleSmall?.copyWith(
                                color: kClrSystem,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Placeholder(
            fallbackWidth: context.height * 0.1,
          ),
        ),
      ],
    );
  }
}
