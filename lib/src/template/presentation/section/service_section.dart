import 'package:flutter/material.dart';

import '../widgets/custom_grid_view.dart';
import '../widgets/widgets.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: "Service",
        child: CustomGridView(
          itemCount: 5,
          child: CircleAvatar(),
        ),
      );
}
