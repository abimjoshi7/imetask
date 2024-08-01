import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/core.dart';
import 'package:imepay/src/features/features.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.lightbulb_circle,
                    size: 10,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    switch (context.watch<RewardCubit>().state) {
                      RewardSuccess(:final rewardDetails) =>
                        rewardDetails.isEmpty
                            ? "0"
                            : rewardDetails.first.currentCredits.toString(),
                      _ => "0",
                    },
                    style: context.labelLarge?.copyWith(
                      color: kClrSystem,
                    ),
                  ),
                ],
              ),
              Text(
                  switch (context.watch<RewardCubit>().state) {
                    RewardSuccess(:final rewardDetails) => rewardDetails.isEmpty
                        ? "0"
                        : rewardDetails.first.memberType,
                    _ => "0",
                  },
                  style: context.titleLarge?.copyWith(
                    color: kClrSystem,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                "500 point to Gold",
                style: context.labelSmall?.copyWith(
                  color: kClrSystem,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Placeholder(
              fallbackWidth: context.height * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
