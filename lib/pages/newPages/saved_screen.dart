import 'dart:collection';

import 'package:explorando_clima_app/model/place_list.dart';
import 'package:explorando_clima_app/pages/component/screen_header_text.dart';
import 'package:explorando_clima_app/pages/newPages/featured_images_card.dart';
import 'package:explorando_clima_app/pages/newPages/place_list_screen.dart';
import 'package:explorando_clima_app/pages/newPages/model_home_page.dart';
import 'package:explorando_clima_app/util/intersperse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({required this.savedLists, Key? key}) : super(key: key);
  final List<PlaceList> savedLists;

  List<Widget> _buildSavedListWidgets(BuildContext context) {
    List<Widget> widgets = savedLists.map((list) {
      List<String> chosenImages = [];
      Map<int, Queue<String>> placeImageMapping = {};
      for (var place in list.savedPlaces) {
        placeImageMapping[place.hashCode] = Queue.from(place.imageUrls);
      }

      bool keepGoing;
      do {
        keepGoing = false;
        for (var entry in placeImageMapping.entries) {
          if (entry.value.isNotEmpty) {
            chosenImages.add(entry.value.removeFirst());
          }
          if (entry.value.isNotEmpty) keepGoing = true;
        }
      } while (keepGoing);

      return SizedBox(
        height: 280,
        child: FeaturedImagesCard(
          imageUrls: chosenImages,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Theme(
                data: Theme.of(context),
                child: PlaceListScreen(
                  placeList: list,
                ),
              ),
            ),
          ),
          titleText: list.title,
          subtitleText: list.numStaysText,
        ),
      );
    }).toList();

    return intersperse(const SizedBox(height: 24), widgets).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kVerticalPadding,
        ),
        children: [
          const ScreenHeaderText(titleText: 'Tipos de nuvens'),
          const SizedBox(height: 16),
          ..._buildSavedListWidgets(context),
        ],
      ),
    );
  }
}
