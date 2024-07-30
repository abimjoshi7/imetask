import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/color_palette.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        bool isSelected = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 4,
          width: isSelected ? 8 : 6,
          decoration: BoxDecoration(
            color: isSelected ? kClrRed : kClrDisabled.withOpacity(0.1),
            shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
            borderRadius: isSelected ? BorderRadius.circular(5.0) : null,
          ),
        );
      }),
    );
  }
}
