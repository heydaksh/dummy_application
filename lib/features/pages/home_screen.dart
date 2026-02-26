import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../widgets/app_bottom_nav_bar.dart';
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
  int _selectedTabIndex = 1;

  final PageController _pageController = PageController(initialPage: 0);

  final NotchBottomBarController _notchController = NotchBottomBarController(
    index: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    _notchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building HomePage');

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildHomePage(),
          const Scaffold(
            body: Center(child: Text('Explore Comming Soon...')),
            backgroundColor: AppColors.cardBackground,
          ),
          const Scaffold(
            body: Center(child: Text('History Comming Soon...')),
            backgroundColor: AppColors.cardBackground,
          ),
          const Scaffold(
            body: Center(child: Text('Profile Comming Soon...')),
            backgroundColor: AppColors.cardBackground,
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        controller: _notchController,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  Widget _buildHomePage() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
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
            const SectionTitle(title: 'Featured Home', buttonOn: true),
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
              bannerUrl:
                  'https://www.incharge.org/wp-content/uploads/2024/03/average-monthly-house-expenses.jpg',
            ),
            const SizedBox(height: 24),

            // ─── 7. SUGGESTED FOR YOU ───
            const SectionTitle(title: 'Suggested For You', buttonOn: true),
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
              bannerUrl:
                  'https://images.unsplash.com/photo-1722340319321-f73f2b96e0ff?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGNvbWZvcnQlMjB6b25lfGVufDB8fDB8fHww',
            ),
            const SizedBox(height: 40),
            Text(
              "More data comming soon...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.transparent.withValues(alpha: 0.05),
                  ),
                ],
                fontStyle: FontStyle.italic,
                color: Colors.transparent.withValues(alpha: 0.1),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
