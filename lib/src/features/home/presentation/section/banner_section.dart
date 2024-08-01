import 'package:flutter/material.dart';
import 'package:imepay/src/core/core.dart';

import '../widgets/widgets.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  late PageController _pageController;
  int currentPage = 0;
  final int itemCount = 4;

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
            height: context.height * 0.2,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: OverflowBox(
                    maxWidth: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: itemCount,
                      padEnds: false,
                      itemBuilder: (context, index) =>
                          _buildCarouselItem(index),
                    ),
                  ),
                ),
                DotIndicator(currentIndex: currentPage, count: itemCount),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(int index) {
    final double scale = (index == currentPage) ? 1.0 : 0.9;
    final EdgeInsets padding = index == currentPage
        ? (index == itemCount - 1
            ? const EdgeInsets.only(right: 16)
            : const EdgeInsets.only(left: 16))
        : const EdgeInsets.all(0);

    return Transform.scale(
      scale: scale,
      child: Padding(
        padding: padding,
        child: _CarouselItem(index: index),
      ),
    );
  }
}

class _CarouselItem extends StatelessWidget {
  final int index;

  const _CarouselItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card.outlined(
            color: _getCardColor(index),
            child: Container(
              decoration: BoxDecoration(
                gradient: _getGradient(index),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _getCardContent(index),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _getCardColor(int index) {
    return index == 0 ? kClrBar : kClrBg;
  }

  LinearGradient? _getGradient(int index) {
    if (index == 1) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black12,
          Colors.black26,
          Colors.black54,
        ],
      );
    }
    return null;
  }

  Widget _getCardContent(int index) {
    switch (index) {
      case 0:
        return const WalletInfoCard();
      case 1:
        return const MembershipCard();
      case 2:
        return const BannerCard(
          icon: Icons.link,
          title: "Link your bank",
        );
      case 3:
        return const BannerCard(
          icon: Icons.add,
          title: "Become IME Sahayatri",
        );
      default:
        return Container();
    }
  }
}
