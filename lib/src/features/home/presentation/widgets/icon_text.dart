import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/core/utils/color_palette.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.icon,
    required this.title,
    this.textColor = kClrBlack,
  });

  final Widget icon;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: icon),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: context.labelMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
}
