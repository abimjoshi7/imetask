import 'package:flutter/material.dart';
import 'package:imepay/src/core/utils/color_palette.dart';

import '../widgets/custom_grid_view.dart';
import '../widgets/widgets.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) => SectionView(
        label: "Services",
        child: CustomGridView(
          aspectRatio: 1.2,
          itemCount: 5,
          child: IconText(
            textColor: Colors.black,
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    kClrTopGradnt,
                    kClrTopGradnt,
                    kClrBtmGradnt,
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.account_balance_outlined,
                ),
              ),
            ),
            title: "Loan, EMI & Credit Card",
          ),
        ),
      );
}
