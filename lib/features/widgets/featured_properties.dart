import 'package:flutter/material.dart';

import '../pages/property_card.dart';

/// ─── FEATURED PROPERTIES ───
class FeaturedProperties extends StatelessWidget {
  const FeaturedProperties({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building FeaturedProperties List');
    return SizedBox(
      height: 320,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const PropertyCard(
            title: 'Earth House, London',
            price: '\$215',
            image:
                "https://media.istockphoto.com/id/477940899/photo/london-home-chelsea.webp?a=1&b=1&s=612x612&w=0&k=20&c=gUNASoO0xwB2C0JbieYtJkb6oGZ0FGliYM7eqzz0QDc=",
            duration: '/week',
            walkTime: '20 min',
            bikeTime: '15 min',
            carTime: '5 min',
          );
        },
      ),
    );
  }
}
