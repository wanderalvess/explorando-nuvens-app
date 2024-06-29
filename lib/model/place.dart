import 'package:explorando_clima_app/model/profile.dart';
import 'package:explorando_clima_app/pages/enum/place_type.dart';

/// Represents a place to stay.
class Place {
  final String title;
  final PlaceType type;
  final String? description;

  final String city;
  final String state;
  final String country;
  final String address;
  final String zipcode;

  /// List of images showcasing the place. The first in the list is used as the feature image.
  final List<String> imageUrls;
  final double rating;
  final int numberOfRatings;
  final double costPerNight;
  final int guestCount;
  final int bedroomCount;
  final int bedCount;
  final int bathCount;
  final Profile owner;

  String get numBedsText => "$bedCount bed${bedCount == 1 ? "" : "s"}";
  String get numGuestsText => "$guestCount guest${guestCount == 1 ? "" : "s"}";
  String get numBedroomText =>
      "$bedroomCount bedroom${bedroomCount == 1 ? "" : "s"}";
  String get numBathsText => "$bathCount bath${bathCount == 1 ? "" : "s"}";

  String get typeText => type.toString().split('.')[1];

  const Place({
    required this.title,
    required this.type,
    required this.city,
    required this.state,
    required this.address,
    required this.zipcode,
    required this.country,
    required this.imageUrls,
    required this.rating,
    required this.numberOfRatings,
    required this.costPerNight,
    required this.guestCount,
    required this.bedroomCount,
    required this.bedCount,
    required this.bathCount,
    this.description,
    required this.owner,
  });
}