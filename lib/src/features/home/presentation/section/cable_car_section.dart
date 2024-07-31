import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CableCarSection extends StatelessWidget {
  const CableCarSection({super.key});

  @override
  Widget build(BuildContext context) => const SectionView(
        label: "Cable Car",
        child: CustomGridView(
          itemCount: 5,
          child: IconText(
            title: "Cable Car",
            icon: CircleAvatar(),
          ),
        ),
      );
}
