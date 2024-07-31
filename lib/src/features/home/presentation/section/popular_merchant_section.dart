import 'package:flutter/material.dart';

import '../widgets/custom_grid_view.dart';
import '../widgets/icon_text.dart';
import '../widgets/section_view.dart';

class PopularMerchantSection extends StatelessWidget {
  const PopularMerchantSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: "Popular Merchants",
        trailingCallback: () {},
        trailingText: "See All",
        child: const CustomGridView(
          itemCount: 5,
          child: IconText(
            title: "Cable Car",
            icon: CircleAvatar(),
          ),
        ),
      );
}
