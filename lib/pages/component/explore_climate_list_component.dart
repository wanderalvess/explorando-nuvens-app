import 'package:flutter/material.dart';
import 'package:explorando_clima_app/pages/component/large_titled_image_list_view.dart';
import 'package:explorando_clima_app/pages/component/large_titled_image_widget.dart';

class ExploreClimateListComponent extends StatelessWidget {
  const ExploreClimateListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    const exploreClimateListWidgets = [
      LargeTitledImageWidget(
        text: 'Climas do Brasil',
        imageUrl: 'https://i.postimg.cc/NjyJyTb5/mapa-climas-brasil.webp',
        screen: 'Climas do Brasil'
      ),
      LargeTitledImageWidget(
        text: 'Tempo e Clima',
        imageUrl: 'https://i.postimg.cc/T3ZknwHQ/paisagem-ceu-tempestuoso.webp',
        screen: 'Tempo e Clima'
      ),
      LargeTitledImageWidget(
        text: 'Fatores Climáticos',
        imageUrl: 'https://i.postimg.cc/ydKvrGKZ/fatores-climaticos.jpg',
        screen: 'Fatores Climáticos'
      ),
      LargeTitledImageWidget(
        text: 'Fenômenos Climáticos',
        imageUrl: 'https://i.postimg.cc/5tLsgVhJ/formacao-furacao.webp',
        screen: 'Fenômenos Climáticos'
      ),
    ];
    return const LargeTitledImageListView(widgets: exploreClimateListWidgets);
  }
}
