import 'package:flutter/material.dart';

import '../widgets/custom_grid_view.dart';
import '../widgets/icon_text.dart';
import '../widgets/section_view.dart';

class NewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SectionView(
        label: "What's New",
        child: CustomGridView(
          itemCount: 5,
          child: IconText(
            title: "Cable Car",
            icon: CircleAvatar(),
          ),
        ),
      );
}
