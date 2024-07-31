import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/context_ext.dart';

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
                    Icons.markunread_mailbox_rounded,
                    size: 10,
                  ),
                  Text(
                    '0',
                    style: context.labelLarge,
                  ),
                ],
              ),
              Text("data",
                  style: context.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                "500 point to Gold",
                style: context.labelSmall?.copyWith(
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
