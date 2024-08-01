import 'package:flutter/material.dart';
import 'package:imepay/src/core/core.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.builder,
    required this.count,
  });

  final String title;
  final Widget Function(int) builder;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 2,
              width: context.width * 0.2,
              decoration: BoxDecoration(
                color: kClrDisabled,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          Text(
            title,
            style: context.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          ...List.generate(
            count,
            builder,
          )
        ],
      ),
    );
  }
}
