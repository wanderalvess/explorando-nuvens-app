import 'package:flutter/material.dart';
import 'package:explorando_clima_app/pages/component/large_titled_image_list_view.dart';
import 'package:explorando_clima_app/pages/component/large_titled_image_widget.dart';

class LiveAnywhereComponent extends StatelessWidget {
  const LiveAnywhereComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const liveAnywhereWidgets = [
      LargeTitledImageWidget(
        text: 'Cirrus',
        imageUrl: 'https://i.postimg.cc/5tLdF8V8/cirrus1.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Cumulus',
        imageUrl: 'https://i.postimg.cc/3R1qgBb0/cumulus.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Stratus',
        imageUrl: 'https://i.postimg.cc/y6rQskqK/stratus-opacus.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Cirrostratus',
        imageUrl: 'https://i.postimg.cc/m25tXQ3X/Cirrostratus.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Cumulonimbus',
        imageUrl: 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Stratocumulus',
        imageUrl: 'https://i.postimg.cc/KcHzk3CY/stratocumulus.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Altocumulus',
        imageUrl: 'https://i.postimg.cc/Wz9QPnGc/altocumulus.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Altostratus',
        imageUrl: 'https://i.postimg.cc/Mfqh2ftV/Altostratus.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Cumulonimbus',
        imageUrl: 'https://i.postimg.cc/Bbwwzv3q/cumulonimbus.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Cirrocumulus',
        imageUrl: 'https://i.postimg.cc/MXwTKsFb/Cirrocumulus.jpg',
      ),
      LargeTitledImageWidget(
        text: 'Nimbostratus',
        imageUrl: 'https://i.postimg.cc/prfm4CZc/Nimbostratus.jpg',
      ),
    ];
    return LargeTitledImageListView(widgets: liveAnywhereWidgets);
  }
}
