import 'package:cached_network_image/cached_network_image.dart';
import 'package:dummy_application/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String price;
  final String duration;
  final String walkTime;
  final String bikeTime;
  final String carTime;
  final String image;

  const PropertyCard({
    super.key,
    required this.title,
    required this.price,
    required this.duration,
    required this.walkTime,
    required this.image,
    required this.bikeTime,
    required this.carTime,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    debugPrint('Building PropertyCard: $title');

    return Container(
      width: size.width * 0.8,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              color: Colors.grey,
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColors.primaryBlue),
              ),
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    Text(
                      duration,
                      style: const TextStyle(color: AppColors.textGrey),
                    ),
                    const Spacer(),
                    // Arrow Button
                    CircleAvatar(
                      backgroundColor: AppColors.primaryBlue,
                      radius: 16,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                //  Row
                Row(
                  children: [
                    _buildIconText(Icons.directions_walk, walkTime),
                    const SizedBox(width: 12),
                    _buildIconText(Icons.directions_bike, bikeTime),
                    const SizedBox(width: 12),
                    _buildIconText(Icons.directions_car, carTime),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    debugPrint('Building IconText for: $text');
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textGrey),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: AppColors.textGrey),
        ),
      ],
    );
  }
}
