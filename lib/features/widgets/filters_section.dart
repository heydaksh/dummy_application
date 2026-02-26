import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

/// ─── FILTERS SECTION ───
/// Displays a "Filters" label with horizontally scrollable filter chips.
class FiltersSection extends StatelessWidget {
  const FiltersSection({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building FiltersSection');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Filters label with icon
          const Icon(Icons.tune_rounded, size: 22, color: AppColors.textDark),
          const SizedBox(width: 8),
          const Text(
            'Filters',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(width: 14),

          // Chips
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(Icons.gps_fixed, 'Distance'),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    Icons.monetization_on_outlined,
                    'Budget Range',
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(Icons.access_time_rounded, 'Duration'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.chipBackground),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.primaryBlue),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.textDark),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18,
            color: AppColors.textGrey,
          ),
        ],
      ),
    );
  }
}
