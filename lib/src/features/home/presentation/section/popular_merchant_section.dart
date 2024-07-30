import 'package:flutter/material.dart';

import '../widgets/custom_grid_view.dart';
import '../widgets/icon_text.dart';
import '../widgets/section_view.dart';

class PopularMerchantSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SectionView(
        label: "Popular Merchants",
        child: CustomGridView(
          itemCount: 5,
          child: IconText(
            title: "Cable Car",
            icon: CircleAvatar(),
          ),
        ),
        trailingCallback: () {},
        trailingText: "See All",
      );
}
