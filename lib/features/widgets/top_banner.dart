import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

/// ─── TOP BANNER WITH GRADIENT ───
/// Contains greeting, notification/heart icons, Jobs/Stay tabs, and search bar.
class TopBanner extends StatelessWidget {
  final int selectedTabIndex;
  final ValueChanged<int> onTabChanged;

  const TopBanner({
    super.key,
    required this.selectedTabIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Building TopBanner');
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryCyan, AppColors.primaryBlue],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, topPadding + 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── TOP ROW: Greeting + Icons ───
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Greeting
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Priyanka',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'University of Manchester',
                      style: TextStyle(fontSize: 13, color: AppColors.white),
                    ),
                  ],
                ),
                // ─── Notification & Heart Icons ───
                Row(
                  children: [
                    _BannerIconButton(
                      icon: Icons.notifications_none_rounded,
                      onTap: () => debugPrint('Notification icon tapped'),
                    ),
                    const SizedBox(width: 8),
                    _BannerIconButton(
                      icon: Icons.favorite_border_rounded,
                      onTap: () => debugPrint('Favorites icon tapped'),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 18),

            // ─── JOBS / STAY TABS ───
            _buildJobsStayTabs(),

            const SizedBox(height: 18),

            // ─── SEARCH BAR + MAP VIEW ───
            _buildSearchRow(),
          ],
        ),
      ),
    );
  }

  // ─── Jobs / Stay Toggle Tabs ───
  Widget _buildJobsStayTabs() {
    return Row(
      children: [
        _buildTab(icon: Icons.work_outline_rounded, label: 'Jobs', index: 0),
        const SizedBox(width: 16),
        _buildTab(icon: Icons.home_rounded, label: 'Stay', index: 1),
      ],
    );
  }

  Widget _buildTab({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        debugPrint('Tab tapped: $label');
        onTabChanged(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.white
              : AppColors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.primaryBlue : AppColors.white,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primaryBlue : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Search Bar + Map View Button ───
  Widget _buildSearchRow() {
    return Row(
      children: [
        // Search Field
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Search jobs or houses',
                    style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                  ),
                ),
                // Blue circular search button
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBlue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Map View Button
        GestureDetector(
          onTap: () => debugPrint('Map View tapped'),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.map_outlined,
                  size: 20,
                  color: AppColors.primaryBlue,
                ),
                const SizedBox(height: 2),
                Text(
                  'Map View',
                  style: TextStyle(fontSize: 7, color: AppColors.primaryBlue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// ─── PRIVATE HELPER WIDGET ───
// ═══════════════════════════════════════════════════════════

/// Small translucent icon button used in the banner header
class _BannerIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _BannerIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white, size: 22),
      ),
    );
  }
}
