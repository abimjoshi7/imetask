import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/context_ext.dart';
import 'package:imepay/src/core/utils/color_palette.dart';

class SectionView extends StatelessWidget {
  final String label;
  final Widget child;
  final String? trailingText;
  final VoidCallback? trailingCallback;

  const SectionView(
      {super.key,
      required this.label,
      required this.child,
      this.trailingText,
      this.trailingCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: context.labelMedium?.copyWith(
                    color: kClrDisabled,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (trailingText != null)
                  TextButton(
                    onPressed: trailingCallback ?? () {},
                    child: Text(
                      trailingText!,
                      style: context.labelMedium?.copyWith(
                        color: kClrRed,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
