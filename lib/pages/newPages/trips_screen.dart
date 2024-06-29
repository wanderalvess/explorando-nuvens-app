
import 'package:explorando_clima_app/data/data.dart';
import 'package:explorando_clima_app/pages/component/screen_header_text.dart';
import 'package:explorando_clima_app/pages/component/simple_text_tabs.dart';
import 'package:explorando_clima_app/pages/newPages/place_screen.dart';
import 'package:explorando_clima_app/pages/newPages/stay_card_widget.dart';
import 'package:explorando_clima_app/pages/new_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({this.navigateToExploreScreen, Key? key}) : super(key: key);
  final Function? navigateToExploreScreen;

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  late int activeTabIndex;

  @override
  void initState() {
    super.initState();
    activeTabIndex = 0;
  }

  setActiveTab(int index) {
    setState(() {
      activeTabIndex = index;
    });
  }

  List<Widget> _buildUpcomingTab() {
    // Access stays where current time is in between time start and end and generate StayCardWidget from them; Otherwise you can show below
    return [
      RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          text:
          "When you're ready to plan your next trip, we're here to help. ",
          children: [
            TextSpan(
              text: 'Learn more',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //Launch your site here
                },
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 32),
      SizedBox(
        height: 300,
        child: Image.network(
          campingImageUrl,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 32),
      ElevatedButton(
        onPressed: widget.navigateToExploreScreen as void Function()?,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[900],
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Explore Flutter UI',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildPastTab() {
    // Access stays for this profile with end time range in the past and create list of StayCardWidget from them.
    return [
      StayCardWidget(
        stay: aspenStay,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Theme(
              data: Theme.of(context),
              child: PlaceScreen(
                place: aspenStay.place,
              ),
            ),
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          children: [
            const ScreenHeaderText(
              titleText: 'Trips',
            ),
            const SizedBox(height: 32),
            SimpleTextTabs(
              labels: const ['Trips', 'Upcoming'],
              onTabChange: setActiveTab,
            ),
            const SizedBox(height: 32),
            ...[
              _buildUpcomingTab(),
              _buildPastTab(),
            ][activeTabIndex],
          ],
        ),
      ),
    );
  }
}