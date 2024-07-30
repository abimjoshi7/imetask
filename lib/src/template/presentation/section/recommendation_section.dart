import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: "Recommendation",
        child: Row(
          children: [
            Column(
              children: [
                Container(),
                Text("Verify Email"),
              ],
            )
          ],
        ),
      );
}
