import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:imepay/src/features/home/presentation/widgets/dot_indicator.dart';

import '../widgets/widgets.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: "Promotions",
        child: CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, realIndex) => Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DotIndicator(currentIndex: index, count: 5),
              ),
            ],
          ),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 3.5,
            viewportFraction: 1,
          ),
        ),
      );
}
