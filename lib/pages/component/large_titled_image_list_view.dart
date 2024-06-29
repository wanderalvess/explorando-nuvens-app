import 'package:flutter/material.dart';
import 'package:explorando_clima_app/pages/component/large_titled_image_widget.dart';
import 'package:explorando_clima_app/pages/newPages/model_home_page.dart';

class LargeTitledImageListView extends StatelessWidget {
  const LargeTitledImageListView({required this.widgets, Key? key}) : super(key: key);
  final List<LargeTitledImageWidget> widgets;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 360,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widgets.length,
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        itemBuilder: (_, index) => widgets[index],
        separatorBuilder: (_, index) => const SizedBox(width: 12),
      ),
    );
  }
}
