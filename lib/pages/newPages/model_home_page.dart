import 'dart:collection';
import 'package:explorando_clima_app/data/data.dart';
import 'package:explorando_clima_app/model/place.dart';
import 'package:explorando_clima_app/model/place_list.dart';
import 'package:explorando_clima_app/model/profile.dart';
import 'package:explorando_clima_app/model/stay.dart';
import 'package:explorando_clima_app/pages/component/row_tile_with_image.dart';
import 'package:explorando_clima_app/pages/enum/indicator_type.dart';
import 'package:explorando_clima_app/pages/enum/place_type.dart';
import 'package:explorando_clima_app/pages/newPages/explore_home.dart';
import 'package:explorando_clima_app/pages/newPages/inbox_screen.dart';
import 'package:explorando_clima_app/pages/newPages/profile_screen.dart';
import 'package:explorando_clima_app/pages/newPages/saved_screen.dart';
import 'package:explorando_clima_app/pages/newPages/trips_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


/// Consistent padding for horizontal sides of screen. Most commonly used in ListViews to give content padding but still allow items to scroll off the screen.
const double kHorizontalPadding = 24;

/// Consistent padding for vertical sides of screen.
const double kVerticalPadding = 64;

class ModelHomePage extends StatefulWidget {
  const ModelHomePage({Key? key}) : super(key: key);

  @override
  State<ModelHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<ModelHomePage> {
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
                icon: Icon(Icons.cloud),
                label: 'Tipos de Nuvens',
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
            //const ExploreScreen(),
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
