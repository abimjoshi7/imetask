import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/utils/color_palette.dart';
import 'package:imepay/src/core/utils/context_ext.dart';
import 'package:imepay/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:imepay/src/features/home/presentation/presentation.dart';

class HomePageV2 extends StatelessWidget {
  const HomePageV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kClrBg,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Hi, User",
                style: context.titleMedium,
              ),
            ),
          ],
        ),
        actions: List.generate(
          3,
          (index) => IconButton(
            onPressed: () {
              if (context.read<HomeCubit>().state is HomeSuccess) {
                final data = context.read<HomeCubit>().state as HomeSuccess;
                print(data.data.responseData);
              }
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: BlocListener<HomeCubit, HomeState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is HomeFailure) context.showSnackBar(state.errorMsg);
          },
          child: RefreshIndicator(
            onRefresh: context.read<HomeCubit>().fetchInitialData,
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
                    SizedBox(
                      height: context.height * 0.08 + 32,
                    )
                  ],
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomBar(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class BottomBar extends StatelessWidget {
//   const BottomBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       height: context.height * 0.08,
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         color: kClrBar,
//         borderRadius: BorderRadius.circular(32),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(
//             5,
//             (index) => switch (index) {
//               2 => Container(
//                   height: context.height * 0.06,
//                   width: context.height * 0.06,
//                   decoration: BoxDecoration(
//                     color: kClrRed,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               _ => Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.home_outlined),
//                     Text(
//                       "data",
//                       style: context.labelSmall?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                   ],
//                 )
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
