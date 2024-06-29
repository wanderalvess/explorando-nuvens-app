// Demo data

import 'package:explorando_clima_app/model/place.dart';
import 'package:explorando_clima_app/model/place_list.dart';
import 'package:explorando_clima_app/model/profile.dart';
import 'package:explorando_clima_app/model/stay.dart';
import 'package:explorando_clima_app/pages/component/row_tile_with_image.dart';
import 'package:explorando_clima_app/pages/enum/place_type.dart';
import 'package:explorando_clima_app/pages/newPages/model_home_page.dart';
import 'package:flutter/material.dart';

//root page: under 'where are you going?/ At "Live anywhere -> Cabins and Cottages'
const imageHome = 'https://i.postimg.cc/Wz9QPnGc/altocumulus.jpg';

//root page: At "Live anywhere -> Entire Homes Image"
const modernHouseImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/modern-house-with-sky_35076-483.jpg';

//root page: At "Live anywhere -> Unique Stays"
const uniqueLakeCabinImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/brown-wooden-house-near-lake-mountain-during-daytime_414077-64.jpg';

//root page: At "Live anywhere -> Pets Allowed"
const dogBeingLovedImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/guy-his-girlfriend-are-resting-bedroom-happy-couple-lovingly-looking-their-pet-who-wants-play_197531-13743.jpg';

//root page: At "Experience the world -> Online Experiences"
const elderlyCoupleTabletImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/cheerful-senior-marriage-using-their-digital-tablet_329181-14689.jpg';

//root page: At "Experience the world -> Experiences"
const couplePotteryImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/mutual-creative-work-elegant-couple-casual-clothes-aprons-people-creating-bowl-pottery-wheel-clay-studio_1157-46339.jpg';

//root page: At "Experience the world -> Adventures"
const womanCliffImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/woman-hand-holding-camera-standing-top-rock-nature-travel-concept_335224-887.jpg';

//root page: At "Explore Nearby -> Dallas"
const cityImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/vector-cartoon-illustration-banner-urban-background-with-modern-big-city-buildings_1441-586.jpg';

//root page: At "Explore Nearby -> Austin"
const scooterImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/happy-smiling-man-riding-kick-scooter-sidewalk-flat-illustration-cartoon-hipster-using-electric-scooter_74855-14069.jpg';

//root page: At "Explore Nearby -> Glaveston"
const beachImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/family-vacation-tropical-resort-cartoon-vector-with-happy-mother-relaxing_33099-1387.jpg';

//root page: At "Explore Nearby -> Broken Bow/ HotSprings"
const lakeImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/wooden-pier-boat-river-natural-landscape_33099-1868.jpg';

//root page: At "Explore Nearby -> Canyon Lake"
const waterfallImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/vector-cartoon-waterfall-rocks_33099-2488.jpg';

const locationImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/location_53876-59940.jpg';
const fireplaceImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/cozy-living-room-with-fireplace-christmas-tree_1303-12552.jpg';
const emptyRoomImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/empty-flat-interrior-with-elements-decoration_1303-23910.jpg';
const List<String> apartmentImages = [
  'https://images.unsplash.com/photo-1515263487990-61b07816b324?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
  'https://images.unsplash.com/photo-1493809842364-78817add7ffb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
  'https://images.unsplash.com/photo-1527030280862-64139fba04ca?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1506&q=80'
];
const List<String> condoImages = [
  'https://images.unsplash.com/photo-1599398766399-07f7a828044b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
  'https://images.unsplash.com/photo-1614607242094-b1b2cf769ff3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=933&q=80',
  'https://images.unsplash.com/photo-1571992579655-8134e2b8df0b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80'
];

const String zachTwitterImageUrl =
    'https://pbs.twimg.com/profile_images/1357396637669277701/wwYAC3rk_400x400.jpg';

const String campingImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/travel/camping_nobg.png';

const String loremIpsumText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nulla dolor, fermentum nec rhoncus vitae, vehicula quis ipsum. Mauris dapibus velit in quam scelerisque gravida. Etiam luctus augue ut lacus iaculis vehicula. In vel pretium arcu. Fusce fringilla volutpat hendrerit. Morbi nec accumsan nunc. Integer at iaculis justo. Ut dignissim scelerisque mi vitae consectetur. Mauris tincidunt erat at mi feugiat, id gravida justo suscipit. Vestibulum non ipsum varius, sagittis est vitae, ultrices est. Donec semper ligula vel urna ultricies varius. Aenean lacinia risus ut aliquam bibendum. Nullam justo ex, auctor ultricies eros a, commodo dapibus massa. Etiam tristique semper tempus. Vivamus elementum nisl neque, eu eleifend metus lobortis sed.';



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
    city: 'Cirrus',
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
    city: 'Cirrus',
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
    imageUrls: [imageHome, fireplaceImageUrl, emptyRoomImageUrl],
    bathCount: 2,
    bedCount: 3,
    bedroomCount: 2,
    costPerNight: 201,
    guestCount: 6,
    numberOfRatings: 802,
    rating: 4.8,
    owner: zachProfile);

const PlaceList austinList =
PlaceList(title: 'Cirrus', savedPlaces: [austinPlace1, austinPlace2]);

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
