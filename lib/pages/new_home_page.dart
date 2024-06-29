import 'dart:collection';
import 'package:explorando_clima_app/data/data.dart';
import 'package:explorando_clima_app/model/place.dart';
import 'package:explorando_clima_app/model/place_list.dart';
import 'package:explorando_clima_app/model/profile.dart';
import 'package:explorando_clima_app/model/stay.dart';
import 'package:explorando_clima_app/pages/component/row_tile_with_image.dart';
import 'package:explorando_clima_app/pages/enum/indicator_type.dart';
import 'package:explorando_clima_app/pages/enum/place_type.dart';
import 'package:explorando_clima_app/pages/newPages/explore_screen.dart';
import 'package:explorando_clima_app/pages/newPages/inbox_screen.dart';
import 'package:explorando_clima_app/pages/newPages/profile_screen.dart';
import 'package:explorando_clima_app/pages/newPages/saved_screen.dart';
import 'package:explorando_clima_app/pages/newPages/trips_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

//root page: under 'where are you going?/ At "Live anywhere -> Cabins and Cottages'
const cabinImageUrl = 'https://i.imgur.com/aT7HSfh.jpg';

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

/// Consistent padding for horizontal sides of screen. Most commonly used in ListViews to give content padding but still allow items to scroll off the screen.
const double kHorizontalPadding = 24;

/// Consistent padding for vertical sides of screen.
const double kVerticalPadding = 64;

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  late int navBarIndex;

  @override
  void initState() {
    super.initState();
    navBarIndex = 0;
  }

  navigateToExplore() {
    setState(() {
      navBarIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.pink,
        textSelectionTheme: Theme.of(context)
            .textSelectionTheme
            .copyWith(cursorColor: Colors.pink),
      ),
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: navBarIndex,
            onTap: (index) {
              setState(() {
                navBarIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.all_inclusive),
                label: 'Trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profile',
              ),
            ],
          ),
          body: [
            const ExploreScreen(),
            const SavedScreen(savedLists: [austinList, aspenList]),
            TripsScreen(navigateToExploreScreen: navigateToExplore),
            const InboxScreen(),
            const ProfileScreen(profile: zachProfile)
          ][navBarIndex]),
    );
  }
}


Route createRoute(Widget screen, BuildContext prevContext) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        Theme(data: Theme.of(prevContext), child: screen),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.ease;

      var tween = Tween(begin: 0.0, end: 1.0)
          .animate(CurvedAnimation(parent: animation, curve: curve));

      return ScaleTransition(
        scale: tween,
        child: child,
      );
    },
  );
}
