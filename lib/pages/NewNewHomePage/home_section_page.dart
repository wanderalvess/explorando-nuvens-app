import 'package:flutter/material.dart';
import 'package:explorando_clima_app/pages/brazilian_climates_page.dart';
import 'package:explorando_clima_app/pages/climate_phenomena_page.dart';
import 'package:explorando_clima_app/pages/climatic_factors_page.dart';
import 'package:explorando_clima_app/pages/exploring_clouds_page.dart';
import 'package:explorando_clima_app/pages/privacy_page.dart';
import 'package:explorando_clima_app/pages/terms_page.dart';
import 'package:explorando_clima_app/pages/weather_climate_page.dart';
import 'package:explorando_clima_app/pages/weather_forecast_page.dart';
import 'package:explorando_clima_app/pages/about_page.dart';

class HomeSectionPage extends StatelessWidget {
  final String title;
  final List<Widget> buttons;

  const HomeSectionPage({Key? key, required this.title, required this.buttons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: buttons,
        ),
      ),
    );
  }
}

Widget buildButton(BuildContext context, String text, IconData icon, Widget page) {
  return ElevatedButton.icon(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    },
    icon: Icon(icon, color: Colors.teal),
    label: Text(text, style: TextStyle(fontSize: 16, color: Colors.black)),
  );
}
