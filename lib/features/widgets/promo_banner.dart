import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

// ─── PROMO BANNER ───

class PromoBanner extends StatelessWidget {
  final String subtitle;
  final String title;
  final String bannerUrl;
  final String buttonLabel;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const PromoBanner({
    super.key,
    required this.bannerUrl,
    required this.subtitle,
    required this.title,
    required this.buttonLabel,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: bannerUrl,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryBlue,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors
                      .map((c) => c.withValues(alpha: 0.6))
                      .toList(),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── Subtitle ───
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // ─── Title ───
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // ─── Button ───
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          content: const Text('Feature Comming Soon...'),
                          backgroundColor: AppColors.cardBackground,
                          actions: [
                            TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(
                                  context,
                                ).hideCurrentMaterialBanner();
                              },
                              child: const Text(
                                'Close',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        buttonLabel,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
