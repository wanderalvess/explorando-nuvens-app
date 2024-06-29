import 'package:explorando_clima_app/pages/component/custom_sliver_app_bar.dart';
import 'package:explorando_clima_app/pages/component/experience_the_world_component.dart';
import 'package:explorando_clima_app/pages/component/explore_city_grid.dart';
import 'package:explorando_clima_app/pages/component/live_anywhere_component.dart';
import 'package:explorando_clima_app/pages/component/section_title.dart';
import 'package:explorando_clima_app/pages/new_home_page.dart';
import 'package:flutter/cupertino.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32),
                  SectionTitle(text: 'Explore nearby'),
                  SizedBox(height: 24),
                  ExploreCityGrid(),
                  SizedBox(height: 48),
                  SectionTitle(
                    text: 'Live anywhere',
                  ),
                  SizedBox(height: 24),
                  LiveAnywhereComponent(),
                  SizedBox(height: 32),
                  SectionTitle(
                    text: 'Experience the world',
                    subtitle:
                    'Unique activities with local experts—in person or online',
                  ),
                  SizedBox(height: 24),
                  ExperienceTheWorldComponent(),
                  SizedBox(height: 24)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
