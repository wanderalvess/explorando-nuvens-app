import 'package:explorando_clima_app/model/place_list.dart';
import 'package:explorando_clima_app/pages/component/app_bar_back_button.dart';
import 'package:explorando_clima_app/pages/component/my_divider.dart';
import 'package:explorando_clima_app/pages/component/screen_header_text.dart';
import 'package:explorando_clima_app/pages/newPages/place_card_widget.dart';
import 'package:explorando_clima_app/pages/newPages/place_screen.dart';
import 'package:explorando_clima_app/pages/newPages/model_home_page.dart';
import 'package:explorando_clima_app/util/intersperse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({required this.placeList, Key? key}) : super(key: key);
  final PlaceList placeList;

  @override
  Widget build(BuildContext context) {
    buildCardTiles() {
      List<Widget> widgets = placeList.savedPlaces
          .map(
            (p) => PlaceCardWidget(
          place: p,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Theme(
                  data: Theme.of(context),
                  child: PlaceScreen(
                    place: p,
                  ),
                ),
              ),
            );
          },
        ),
      )
          .toList();
      return intersperse(const SizedBox(height: 32), widgets).toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const AppBarBackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: 16,
        ),
        children: [
          ScreenHeaderText(
            titleText: placeList.title,
          ),
          const MyDivider(),
          Text(
            placeList.numStaysText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          ...buildCardTiles(),
          const SizedBox(height: kVerticalPadding),
        ],
      ),
    );
  }
}
