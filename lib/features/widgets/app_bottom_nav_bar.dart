import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

/// ─── BOTTOM NAV BAR (Animated Notch) ───
class AppBottomNavBar extends StatelessWidget {
  final NotchBottomBarController controller;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Building BottomNavBar');
    return AnimatedNotchBottomBar(
      notchBottomBarController: controller,
      color: AppColors.white,
      notchColor: AppColors.primaryBlue,
      showLabel: false,
      showShadow: false,
      showBlurBottomBar: false,
      removeMargins: false,
      bottomBarHeight: 60,
      durationInMilliSeconds: 300,
      elevation: 8,
      // itemLabelStyle: const TextStyle(
      //   fontSize: 11,
      //   fontWeight: FontWeight.w500,
      //   color: AppColors.primaryBlue,
      // ),
      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(Icons.home_outlined, color: AppColors.textGrey),
          activeItem: Icon(Icons.home_rounded, color: AppColors.white),
          itemLabel: 'Home',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.explore_outlined, color: AppColors.textGrey),
          activeItem: Icon(Icons.explore_rounded, color: AppColors.white),
          itemLabel: 'Explore',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.access_time_outlined,
            color: AppColors.textGrey,
          ),
          activeItem: Icon(Icons.access_time_filled, color: AppColors.white),
          itemLabel: 'History',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.person_outline_rounded,
            color: AppColors.textGrey,
          ),
          activeItem: Icon(Icons.person_rounded, color: AppColors.white),
          itemLabel: 'Profile',
        ),
      ],
      onTap: onTap,
      kIconSize: 15,
      kBottomRadius: 0,
    );
  }
}
