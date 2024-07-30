import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.child,
    required this.itemCount,
  });

  final Widget child;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, index) => CircleAvatar(),
      itemCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
