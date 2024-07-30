import 'package:flutter/material.dart';

class QuickLinkSection extends StatelessWidget {
  const QuickLinkSection({super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.red,
              height: 100,
              width: 80,
            ),
          ),
        ),
      );
}
