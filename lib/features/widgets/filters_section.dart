import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_colors.dart';

/// ─── FILTERS SECTION ───
class FiltersSection extends StatefulWidget {
  const FiltersSection({super.key});

  @override
  State<FiltersSection> createState() => _FiltersSectionState();
}

class _FiltersSectionState extends State<FiltersSection> {
  final Map<String, String> _activeFilters = {};

  final Map<String, List<String>> _filterOptions = {
    'Distance': ['5 km', '10 km', '20 km', '50+ km'],
    'Budget Range': [
      '\$100 - \$500',
      '\$500 - \$1000',
      '\$1000 - \$2000',
      '\$2000+',
    ],
    'Duration': ['1 Month', '3 Months', '6 Months', '1 Year+'],
  };

  void _applyFilter(String label, String? selectedOption) {
    setState(() {
      if (selectedOption != null) {
        _activeFilters[label] = selectedOption;
      } else {
        _activeFilters.remove(label);
      }
    });
  }

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
    final bool isActive = _activeFilters.containsKey(label);

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        _showFilterBottomSheet(context, label);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryBlue : AppColors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isActive ? AppColors.primaryBlue : AppColors.chipBackground,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive ? Colors.white : AppColors.primaryBlue,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isActive ? Colors.white : AppColors.textDark,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: isActive ? Colors.white70 : AppColors.textGrey,
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context, String label) {
    FocusScope.of(context).unfocus();
    String? localSelection = _activeFilters[label];
    final List<String> options = _filterOptions[label] ?? [];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  //  indicator
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Title & Close Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade100,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Options
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: options.map((option) {
                        return _buildOption(
                          option,
                          localSelection == option,
                          () {
                            HapticFeedback.lightImpact();
                            setSheetState(() {
                              localSelection = option;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const Spacer(),

                  // Bottom Buttons
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade100),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _applyFilter(label, null);
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(
                                color: AppColors.primaryBlue,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Clear',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              _applyFilter(label, localSelection);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Apply Filter',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOption(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryBlue.withValues(alpha: 0.1)
              : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.primaryBlue : AppColors.textDark,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
