import 'package:dummy_application/core/constants/app_colors.dart';
import 'package:dummy_application/features/widgets/featured_properties.dart';
import 'package:flutter/material.dart';

class FeaturedHome extends StatelessWidget {
  const FeaturedHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: size.height / 5,
              floating: false,
              pinned: true,
              stretch: true,
              backgroundColor: AppColors.primaryBlue,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  final percent =
                      ((constraints.maxHeight - kToolbarHeight) /
                              (size.height / 4.5 - kToolbarHeight))
                          .clamp(0.0, 1.0);

                  return FlexibleSpaceBar(
                    centerTitle: true,
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: percent < 0.5 ? 1 : 0,
                      child: const Text(
                        "Featured Home",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    background: Container(
                      padding: EdgeInsets.symmetric(vertical: size.height / 40),
                      alignment: Alignment.bottomCenter,
                      child: const Text(
                        "Explore Best Properties",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              iconTheme: const IconThemeData(color: Colors.white),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: FeaturedProperties(scrollDirection: Axis.vertical),
              ),
            ),

            SliverToBoxAdapter(
              child: Text(
                "No more data",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.transparent.withValues(alpha: 0.05),
                    ),
                  ],
                  fontStyle: FontStyle.italic,
                  color: Colors.transparent.withValues(alpha: 0.1),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}
