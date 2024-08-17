import 'package:explorando_clima_app/pages/component/cloud_types_list_component.dart';
import 'package:explorando_clima_app/pages/component/explore_climate_list_component.dart';
import 'package:explorando_clima_app/pages/component/section_title.dart';
import 'package:flutter/material.dart';

class ExploreHome extends StatelessWidget {
  const ExploreHome({
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
                  SizedBox(height: 50),
                  SectionTitle(text: 'Explorando o Clima'),
                  SizedBox(height: 24),
                  ExploreClimateListComponent(),
                  SectionTitle(text: 'Explorando as nuvens'),
                  SizedBox(height: 24),
                  CloudTypesListComponent(),
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
