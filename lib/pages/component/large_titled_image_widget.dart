import 'package:explorando_clima_app/pages/brazilian_climates_page.dart';
import 'package:explorando_clima_app/pages/climate_phenomena_page.dart';
import 'package:explorando_clima_app/pages/climatic_factors_page.dart';
import 'package:flutter/material.dart';
import 'package:explorando_clima_app/pages/cloud_types_page.dart';

import '../weather_climate_page.dart';

class LargeTitledImageWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String screen;

  const LargeTitledImageWidget({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    if (screen == 'Climas do Brasil') {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BrazilianClimatesPage(),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    } else if (screen == 'Tempo e Clima') {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const WeatherClimatePage(),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    } else if (screen == 'Fatores Climáticos') {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClimaticFactorsPage(),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    } else if (screen == 'Fenômenos Climáticos') {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClimatePhenomenaPage(),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CloudTypesPage(nameCloudType: text ),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }
  }
}
