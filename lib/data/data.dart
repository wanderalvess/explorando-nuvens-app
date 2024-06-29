// Demo data

import 'package:explorando_clima_app/model/place.dart';
import 'package:explorando_clima_app/model/place_list.dart';
import 'package:explorando_clima_app/model/profile.dart';
import 'package:explorando_clima_app/model/stay.dart';
import 'package:explorando_clima_app/pages/component/row_tile_with_image.dart';
import 'package:explorando_clima_app/pages/enum/place_type.dart';
import 'package:explorando_clima_app/pages/new_home_page.dart';
import 'package:flutter/material.dart';

const Profile zachProfile = Profile(
  name: 'Zach',
  profileImageUrl: zachTwitterImageUrl,
  isSuperhost: true,
);

const List<RowTileWithImage> cityWidgets = [
  RowTileWithImage(
    title: 'Dallas',
    subtitle: '15 minute drive',
    imageUrl: cityImageUrl,
  ),
  RowTileWithImage(
    title: 'Hot Springs',
    subtitle: '4.5 hour drive',
    imageUrl: lakeImageUrl,
  ),
  RowTileWithImage(
    title: 'Austin',
    subtitle: '3 hour drive',
    imageUrl: scooterImageUrl,
  ),
  RowTileWithImage(
    title: 'Galveston',
    subtitle: '4 hour drive',
    imageUrl: beachImageUrl,
  ),
  RowTileWithImage(
    title: 'Canyon Lake',
    subtitle: '5 hour drive',
    imageUrl: waterfallImageUrl,
  ),
  RowTileWithImage(
    title: 'Broken Bow',
    subtitle: '4 hour drive',
    imageUrl: lakeImageUrl,
  ),
];

const Place austinPlace1 = Place(
    title: 'Apartment home deep in the heart of Austin',
    type: PlaceType.apartment,
    city: 'Austin',
    state: 'Texas',
    address: '123 Main St.',
    zipcode: '123456',
    country: 'United States',
    imageUrls: apartmentImages,
    bathCount: 1,
    bedCount: 1,
    bedroomCount: 1,
    costPerNight: 102,
    guestCount: 3,
    numberOfRatings: 72,
    rating: 4.3,
    owner: zachProfile);

const Place austinPlace2 = Place(
    title: 'Entire condominium near 6th!',
    type: PlaceType.condominium,
    city: 'Austin',
    state: 'Texas',
    address: '612 State St.',
    zipcode: '123456',
    country: 'United States',
    imageUrls: condoImages,
    bathCount: 2,
    bedCount: 2,
    bedroomCount: 2,
    costPerNight: 162,
    guestCount: 5,
    numberOfRatings: 102,
    rating: 4.7,
    owner: zachProfile);

const Place aspen = Place(
    title: 'Cozy Cabin in Aspen',
    type: PlaceType.cabin,
    city: 'Aspen',
    state: 'Colorado',
    address: '123 Grizzly Dr.',
    zipcode: '123456',
    country: 'United States',
    imageUrls: [cabinImageUrl, fireplaceImageUrl, emptyRoomImageUrl],
    bathCount: 2,
    bedCount: 3,
    bedroomCount: 2,
    costPerNight: 201,
    guestCount: 6,
    numberOfRatings: 802,
    rating: 4.8,
    owner: zachProfile);

const PlaceList austinList =
PlaceList(title: 'Austin', savedPlaces: [austinPlace1, austinPlace2]);

const PlaceList aspenList =
PlaceList(title: 'Aspen, Colorado', savedPlaces: [aspen]);

Stay aspenStay = Stay(
  place: aspen,
  people: [zachProfile],
  dateTimeRange: DateTimeRange(
    start: DateTime(2020, 3, 13),
    end: DateTime(2020, 3, 15),
  ),
);
