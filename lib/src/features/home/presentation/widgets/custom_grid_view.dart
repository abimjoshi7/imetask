import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.aspectRatio = 3 / 2,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: aspectRatio,
        mainAxisSpacing: 10,
      ),
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
