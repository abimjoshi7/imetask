import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: "Promotions",
        child: CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, realIndex) => Container(),
          options: CarouselOptions(
            autoPlay: true,
          ),
        ),
      );
}
