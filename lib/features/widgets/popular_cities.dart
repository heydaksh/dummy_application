import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

/// ─── POPULAR CITIES ───
/// Horizontal scrolling list of city cards with gradient text overlay.
class PopularCities extends StatelessWidget {
  const PopularCities({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building PopularCities');

    final cities = [
      {
        'name': 'Manchester',
        'image':
            'https://images.pexels.com/photos/6477711/pexels-photo-6477711.png?auto=compress&cs=tinysrgb&dpr=1&w=500',
      },
      {
        'name': 'Birmingham',
        'image':
            'https://media.istockphoto.com/id/2153095243/photo/birmingham-city-centre-england-united-kingdom.jpg?s=612x612&w=0&k=20&c=eADkU1gHjhyWL6k5YQMgiF5bTnvmad7i2p1_V_J44yA=',
      },
      {
        'name': 'Liverpool',
        'image':
            'https://media.gettyimages.com/id/507801593/photo/liverpool-unesco-waterfront-skyline.jpg?s=612x612&w=0&k=20&c=JM6ipfoI99-tgptCfzX9TzUdPBnqYHPy9d21XbflX4M=',
      },
      {
        'name': 'Paris',
        'image':
            'https://cdn.pixabay.com/photo/2018/08/14/03/15/liverpool-3604550_640.jpg',
      },
      {
        'name': 'Edinburgh',
        'image':
            'https://media.istockphoto.com/id/942686456/photo/liverpool-skyline.jpg?s=612x612&w=0&k=20&c=wPkVqz7zRAeWOnKxBW8r85HCB_FU7MMxzHRBVquJSqM=',
      },
    ];

    return SizedBox(
      height: 110,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: cities.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final city = cities[index];
          return _PopularCityCard(
            name: city['name'] as String,
            image: city['image'] as String,
          );
        },
      ),
    );
  }
}

/// Popular city card with a colored placeholder background
class _PopularCityCard extends StatelessWidget {
  final String name;
  final String image;

  const _PopularCityCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 110,
        height: 110,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // ─── Placeholder background (replace with Image later) ───
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // ─── Gradient scrim for text ───
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.55),
                    ],
                  ),
                ),
              ),
            ),

            // ─── City name ───
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
