import 'package:flutter/material.dart';
import 'package:explorando_clima_app/pages/component/large_titled_image_list_view.dart';
import 'package:explorando_clima_app/pages/component/large_titled_image_widget.dart';

class CloudTypesListComponent extends StatelessWidget {
  const CloudTypesListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cloudTypesListWidgets = [
      LargeTitledImageWidget(
        text: 'Cirrus',
        imageUrl: 'https://i.postimg.cc/5tLdF8V8/cirrus1.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Cumulus',
        imageUrl: 'https://i.postimg.cc/3R1qgBb0/cumulus.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Stratus',
        imageUrl: 'https://i.postimg.cc/y6rQskqK/stratus-opacus.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Cirrostratus',
        imageUrl: 'https://i.postimg.cc/m25tXQ3X/Cirrostratus.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Cumulonimbus',
        imageUrl: 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Stratocumulus',
        imageUrl: 'https://i.postimg.cc/KcHzk3CY/stratocumulus.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Altocumulus',
        imageUrl: 'https://i.postimg.cc/Wz9QPnGc/altocumulus.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Altostratus',
        imageUrl: 'https://i.postimg.cc/Mfqh2ftV/Altostratus.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Cumulonimbus',
        imageUrl: 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Cirrocumulus',
        imageUrl: 'https://i.postimg.cc/MXwTKsFb/Cirrocumulus.jpg',
        screen: 'cloudTypes',
      ),
      LargeTitledImageWidget(
        text: 'Nimbostratus',
        imageUrl: 'https://i.postimg.cc/prfm4CZc/Nimbostratus.jpg',
        screen: 'cloudTypes',
      ),
    ];
    return const LargeTitledImageListView(widgets: cloudTypesListWidgets);
  }
}
