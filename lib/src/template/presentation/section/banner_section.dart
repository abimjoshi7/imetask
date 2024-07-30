import 'package:flutter/material.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  late PageController _pageController;
  int currentPage = 0;
  int itemCount = 5;

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
        SizedBox(
          height: 150,
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
                      child: CarouselItem(index: index),
                    ),
                  );
                } else if (index == currentPage + 1 &&
                    currentPage < itemCount - 1) {
                  return Transform.scale(
                    scale: 0.9,
                    child: CarouselItem(index: index),
                  );
                } else if (index == currentPage - 1 &&
                    currentPage == itemCount - 1) {
                  return Transform.scale(
                    scale: 0.9,
                    child: CarouselItem(index: index),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CarouselItem extends StatelessWidget {
  final int index;

  const CarouselItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: switch (index) {
            0 => WalletInfoCard(),
            _ => Container(),
          },
        ),
      ),
    );
  }
}

class WalletInfoCard extends StatelessWidget {
  const WalletInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("Super Wallet Account Rs. "),
                    Icon(
                      Icons.visibility,
                      size: 16,
                    )
                  ],
                ),
                Text.rich(
                  TextSpan(
                    text: "0",
                    children: [
                      TextSpan(
                        text: ".00",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("Interest Earned"),
                    Icon(
                      Icons.visibility,
                      size: 16,
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    text: "0",
                    children: [
                      TextSpan(
                        text: ".00",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        CircleAvatar(),
      ],
    );
  }
}
