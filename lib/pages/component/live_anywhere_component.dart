import 'package:explorando_clima_app/pages/component/large_titled_image_list_view.dart';
import 'package:explorando_clima_app/pages/component/large_titled_image_widget.dart';
import 'package:explorando_clima_app/pages/new_home_page.dart';
import 'package:flutter/cupertino.dart';

class LiveAnywhereComponent extends StatelessWidget {
  const LiveAnywhereComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const liveAnywhereWidgets = [
      LargeTitledImageWidget(
        text: 'Entire homes',
        imageUrl: modernHouseImageUrl,
      ),
      LargeTitledImageWidget(
        text: 'Unique stays',
        imageUrl: uniqueLakeCabinImageUrl,
      ),
      LargeTitledImageWidget(
        text: 'Cabins and cottages',
        imageUrl: cabinImageUrl,
      ),
      LargeTitledImageWidget(
        text: 'Pets allowed',
        imageUrl: dogBeingLovedImageUrl,
      )
    ];
    return const LargeTitledImageListView(widgets: liveAnywhereWidgets);
  }
}
