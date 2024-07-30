import 'package:flutter/material.dart';

import 'presentation/section/section.dart';

class HomePageV2 extends StatelessWidget {
  const HomePageV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(),
        title: Text(
          "Hi, User",
          // style: context.titleMedium,
        ),
        actions: List.generate(
          3,
          (index) => IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          child: Stack(
            children: [
              ListView(
                children: [
                  BannerSection(),
                  QuickLinkSection(),
                  BankLinkSection(),
                  ServiceSection(),
                  PromotionSection(),
                  RecommendationSection(),
                  NewSection(),
                  CableCarSection(),
                  PopularMerchantSection(),
                ],
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.all(16),
                    height: 60,
                    width: double.maxFinite,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.blue,
      //     fixedColor: Colors.green,
      //     unselectedItemColor: Colors.amberAccent,
      //     currentIndex: 0,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Cards',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: CircleAvatar(),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.search),
      //         label: 'Offers',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: 'History',
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
