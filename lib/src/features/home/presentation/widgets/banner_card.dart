import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/core/utils/color_palette.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kClrRedShade,
                ),
                child: Icon(
                  icon,
                  color: kClrRed,
                ),
              ),
              Text(
                title,
                style: context.labelLarge?.copyWith(),
                maxLines: 2,
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
