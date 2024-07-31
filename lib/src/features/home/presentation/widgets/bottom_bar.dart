import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/core/utils/color_palette.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) return;
    setState(() {
      _selectedIndex = index;
    });

    // Add your page change logic here
    // Example: _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: context.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kClrBar,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () => _onItemTapped(index),
              child: index == 2
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.height * 0.06,
                      decoration: const BoxDecoration(
                        color: kClrRed,
                        shape: BoxShape.circle,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          switch (index) {
                            0 => Icons.home_filled,
                            1 => Icons.credit_card_rounded,
                            3 => Icons.card_giftcard_rounded,
                            4 => Icons.history_rounded,
                            _ => Icons.home_filled,
                          },
                          color:
                              _selectedIndex == index ? kClrRed : kClrDisabled,
                        ),
                        Text(
                          switch (index) {
                            0 => "Home",
                            1 => "Cards",
                            3 => "Offers",
                            4 => "History",
                            _ => "",
                          },
                          style: context.labelSmall?.copyWith(
                            color: _selectedIndex == index
                                ? kClrRed
                                : kClrDisabled,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
