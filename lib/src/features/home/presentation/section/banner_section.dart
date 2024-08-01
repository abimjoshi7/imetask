import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/extensions.dart';

import '../widgets/widgets.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  late PageController _pageController;
  int currentPage = 0;
  int itemCount = 4;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            height: context.height * 0.19,
            width: double.maxFinite,
            child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                pageSnapping: true,
                itemCount: itemCount,
                padEnds: false,
                itemBuilder: (context, index) {
                  if (index == currentPage) {
                    return Transform.scale(
                      scale: 1,
                      child: Padding(
                        padding: index == itemCount - 1
                            ? const EdgeInsets.only(right: 16)
                            : const EdgeInsets.only(left: 16),
                        child: _CarouselItem(index: index),
                      ),
                    );
                  } else if (index == currentPage + 1 &&
                      currentPage < itemCount - 1) {
                    return Transform.scale(
                      scale: 0.9,
                      child: _CarouselItem(index: index),
                    );
                  } else if (index == currentPage - 1 &&
                      currentPage == itemCount - 1) {
                    return Transform.scale(
                      scale: 0.9,
                      child: _CarouselItem(index: index),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CarouselItem extends StatelessWidget {
  final int index;

  const _CarouselItem({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card.outlined(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: switch (index) {
                  0 => const WalletInfoCard(),
                  1 => const MembershipCard(),
                  2 => const BannerCard(
                      icon: Icons.link,
                      title: "Link your bank",
                    ),
                  3 => const BannerCard(
                      icon: Icons.add,
                      title: "Become IME Sahayatri",
                    ),
                  _ => Container(),
                },
              ),
            ),
          ),
        ),
        DotIndicator(currentIndex: index, count: 4)
      ],
    );
  }
}
