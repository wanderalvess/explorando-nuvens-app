import 'package:explorando_clima_app/data/data.dart';
import 'package:explorando_clima_app/pages/newPages/model_home_page.dart';
import 'package:flutter/cupertino.dart';
//não usa mais
class ExploreClimateGrid extends StatelessWidget {
  const ExploreClimateGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          childAspectRatio: .33,
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          scrollDirection: Axis.horizontal,
          children: cityWidgets),
    );
  }
}