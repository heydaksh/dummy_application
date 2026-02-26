import 'package:dummy_application/features/pages/featured_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_colors.dart';

/// ─── SECTION TITLE ───

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllPressed;
  final bool? buttonOn;

  const SectionTitle({
    super.key,
    required this.title,
    this.onSeeAllPressed,
    this.buttonOn = false,
  });

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
          buttonOn!
              ? TextButton(
                  onPressed:
                      onSeeAllPressed ??
                      () {
                        HapticFeedback.lightImpact();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeaturedHome(),
                          ),
                        );
                      },
                  child: const Text(
                    'See all',
                    style: TextStyle(color: AppColors.primaryBlue),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
