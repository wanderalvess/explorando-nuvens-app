import 'package:flutter/material.dart';
import 'package:explorando_clima_app/pages/component/experience_the_world_component.dart';
import 'package:explorando_clima_app/pages/component/explore_climate_grid.dart';
import 'package:explorando_clima_app/pages/component/live_anywhere_component.dart';
import 'package:explorando_clima_app/pages/component/section_title.dart';

class ExploreClimate extends StatelessWidget {
  const ExploreClimate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  SectionTitle(text: 'Explorando o Clima'),
                  SizedBox(height: 24),
                  ExploreClimateGrid(),
                  SizedBox(height: 60),
                  SectionTitle(text: 'Explorando as nuvens'),
                  SizedBox(height: 24),
                  LiveAnywhereComponent(),
                  SizedBox(height: 32),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
