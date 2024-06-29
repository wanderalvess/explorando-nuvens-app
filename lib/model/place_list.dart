import 'package:explorando_clima_app/model/place.dart';

/// Represents a custom list of places favorite by the user. The user may create multiple lists.
/// E.g. A list for saved trips for Colorado and a separate list for saved trips to California
class PlaceList {
  final String title;
  final List<Place> savedPlaces;
  String get numStaysText =>
      "${savedPlaces.length} stay${savedPlaces.length == 1 ? "" : "s"}";

  const PlaceList({required this.title, required this.savedPlaces});
}