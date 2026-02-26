import 'package:flutter/material.dart';

import '../pages/property_card.dart';

/// ─── FEATURED PROPERTIES ───
class FeaturedProperties extends StatefulWidget {
  final Axis scrollDirection;
  final double padHztl;
  final double padVrtcl;

  const FeaturedProperties({
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.padHztl = 20,
    this.padVrtcl = 10,
  });

  @override
  State<FeaturedProperties> createState() => _FeaturedPropertiesState();
}

class _FeaturedPropertiesState extends State<FeaturedProperties> {
  final List<String> imageList = [
    'https://centuryply.com/blogimage/bedroom_1.png',
    'https://t3.ftcdn.net/jpg/04/89/43/94/360_F_489439413_uWDd8VMUOnOTBmchDjoIEMciGyOZGYsr.jpg',
    'https://media.gettyimages.com/id/1326393613/photo/luxurious-bedroom-interior-with-messy-bed-and-armchair-in-holiday-villa-or-in-hotel-seaview.jpg?s=612x612&w=0&k=20&c=4EMk012JY_yqd2s9XtKfFwx2NzRHW1umHmOtkFU-xaI=',
  ];

  final List<String> title = [
    'Earth House, London',
    'Sydney Opera House',
    'Parliament House, Canberra',
  ];

  final List<String> prices = ['215', '299', '199'];

  @override
  Widget build(BuildContext context) {
    debugPrint('Building FeaturedProperties List');

    final isVertical = widget.scrollDirection == Axis.vertical;

    Widget listView = ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: widget.padHztl,
        vertical: widget.padVrtcl,
      ),
      scrollDirection: widget.scrollDirection,
      shrinkWrap: isVertical,
      physics: isVertical
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: isVertical ? 16 : 0,
          width: !isVertical ? 16 : 0,
        );
      },
      itemBuilder: (context, index) {
        return PropertyCard(
          title: title[index],
          price: '\$${prices[index]}',
          image: imageList[index],
          duration: '/week',
          walkTime: '20 min',
          bikeTime: '15 min',
          carTime: '5 min',
        );
      },
    );

    if (isVertical) {
      return listView;
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: listView,
    );
  }
}
