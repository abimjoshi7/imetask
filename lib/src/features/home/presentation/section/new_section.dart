import 'package:flutter/material.dart';

import '../widgets/custom_grid_view.dart';
import '../widgets/icon_text.dart';
import '../widgets/section_view.dart';

class NewSection extends StatelessWidget {
  const NewSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: "What's New",
        child: CustomGridView(
          itemCount: 3,
          child: IconText(
            title: "Cable Car",
            icon: Container(
              height: 40,
              width: 40,
              color: Colors.amber,
              child: const Center(child: Text("data")),
            ),
          ),
        ),
      );
}
