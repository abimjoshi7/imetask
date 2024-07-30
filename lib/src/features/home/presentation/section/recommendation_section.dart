import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/color_palette.dart';

import '../widgets/widgets.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: "Recommendation",
        child: IconText(
          icon: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                color: kClrLightestYellow,
              ),
            ],
          ),
          title: "Verify Email",
        ),
      );
}
