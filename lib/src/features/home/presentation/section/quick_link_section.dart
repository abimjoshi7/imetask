import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/context_ext.dart';
import 'package:imepay/src/core/utils/color_palette.dart';
import 'package:imepay/src/features/home/presentation/widgets/widgets.dart';

class QuickLinkSection extends StatelessWidget {
  const QuickLinkSection({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: List.generate(
          4,
          (index) => SizedBox(
            width: context.width / 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 11,
              ),
              child: IconText(
                icon: CircleAvatar(
                  backgroundColor: kClrRed,
                  foregroundColor: Colors.white,
                  child: quickActionItems.values.elementAt(index),
                ),
                title: quickActionItems.keys.elementAt(index),
              ),
            ),
          ),
        ),
      );
}

Map<String, Icon> quickActionItems = {
  "Add Money": const Icon(
    Icons.add_rounded,
  ),
  "Send Money": const Icon(
    Icons.send_rounded,
  ),
  "Receive Remittanc": const Icon(
    Icons.payments_rounded,
  ),
  "Banking Services": const Icon(
    Icons.account_balance_rounded,
  ),
};
