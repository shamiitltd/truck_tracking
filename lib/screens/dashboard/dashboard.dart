import 'package:flutter/material.dart';

import '../../config/colors/colors.dart';
import '../../config/fonts/fonts.dart';
import '../../config/padding/padding.dart';
import '../../shared/leftdrawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Row(
        children: [
          Padding(padding: AppDimensions.mediumPadding),
          Container(
            padding: AppDimensions.largePadding,
            width: 284,
            child: LeftDrawer(),
          ),
          SizedBox(
            width: AppDimensions.defuaultPadding,
          ),
          Expanded(
            child: Padding(
              padding: AppDimensions.largePadding, // Use the same padding as the LeftDrawer
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whitePageColor,
                  borderRadius: BorderRadius.circular(AppBorderRadius.large),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
