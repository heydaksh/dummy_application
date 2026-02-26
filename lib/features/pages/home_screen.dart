import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/featured_properties.dart';
import '../widgets/filters_section.dart';
import '../widgets/popular_cities.dart';
import '../widgets/promo_banner.dart';
import '../widgets/quick_actions.dart';
import '../widgets/section_title.dart';
import '../widgets/top_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ─── STATE ───
  int _selectedTabIndex = 1; // 0 = Jobs, 1 = Stay
  int _bottomNavIndex = 0;

  /// Controller for the animated notch bottom bar
  final NotchBottomBarController _notchController = NotchBottomBarController(
    index: 0,
  );

  @override
  void dispose() {
    _notchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building HomePage');

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── 1. TOP BANNER ───
            TopBanner(
              selectedTabIndex: _selectedTabIndex,
              onTabChanged: (index) {
                setState(() => _selectedTabIndex = index);
              },
            ),
            const SizedBox(height: 16),

            // ─── 2. FILTERS ───
            const FiltersSection(),
            const SizedBox(height: 20),

            // ─── 3. QUICK ACTIONS ───
            const QuickActions(),
            const SizedBox(height: 24),

            // ─── 4. POPULAR CITIES ───
            const SectionTitle(title: 'Popular Cities'),
            const SizedBox(height: 12),
            const PopularCities(),
            const SizedBox(height: 24),

            // ─── 5. FEATURED HOME ───
            const SectionTitle(title: 'Featured Home'),
            const SizedBox(height: 4),
            const FeaturedProperties(),
            const SizedBox(height: 24),

            // ─── 6. LIVING COST CALCULATOR BANNER ───
            PromoBanner(
              subtitle: 'Living Cost Calculator',
              title: 'Calculate Your\nMonthly Expenses',
              buttonLabel: 'Calculate',
              gradientColors: const [Color(0xFF3A3A3A), Color(0xFF1A1A1A)],
              onTap: () => debugPrint('Calculate tapped'),
            ),
            const SizedBox(height: 24),

            // ─── 7. SUGGESTED FOR YOU ───
            const SectionTitle(title: 'Suggested For You'),
            const SizedBox(height: 4),
            const FeaturedProperties(),
            const SizedBox(height: 24),

            // ─── 8. FIND PROPERTIES BANNER ───
            PromoBanner(
              subtitle: 'Find Properties',
              title: 'Find your comfort\nplace to live in',
              buttonLabel: 'Find',
              gradientColors: const [Color(0xFF2C2C2C), Color(0xFF111111)],
              onTap: () => debugPrint('Find tapped'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        controller: _notchController,
        onTap: (index) {
          debugPrint('Bottom nav tapped: $index');
          setState(() => _bottomNavIndex = index);
        },
      ),
    );
  }
}
