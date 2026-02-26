import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

/// ─── SECTION TITLE ───
/// Reusable row with a bold title on the left and "See all" button on the right.
class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllPressed;

  const SectionTitle({super.key, required this.title, this.onSeeAllPressed});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building SectionTitle: $title');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          TextButton(
            onPressed:
                onSeeAllPressed ??
                () => debugPrint('See all pressed for $title'),
            child: const Text(
              'See all',
              style: TextStyle(color: AppColors.primaryBlue),
            ),
          ),
        ],
      ),
    );
  }
}
