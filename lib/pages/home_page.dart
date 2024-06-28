import 'package:explorando_clima_app/pages/about_page.dart';
import 'package:explorando_clima_app/pages/brazilian_climates_page.dart';
import 'package:explorando_clima_app/pages/climate_phenomena_page.dart';
import 'package:explorando_clima_app/pages/climatic_factors_page.dart';
import 'package:explorando_clima_app/pages/component/drawer_menu.dart';
import 'package:explorando_clima_app/pages/exploring_clouds_page.dart';
import 'package:explorando_clima_app/pages/privacy_page.dart';
import 'package:explorando_clima_app/pages/terms_page.dart';
import 'package:explorando_clima_app/pages/weather_climate_page.dart';
import 'package:explorando_clima_app/pages/weather_forecast_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorando o Clima'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Bem-vindo ao Explorando o Clima!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'O que vamos fazer hoje?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExploringCloudsPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.explore, color: Colors.teal),
                    label: const Text('Explorar Nuvens', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 30, height: 40.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherForecastPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.sunny, color: Colors.teal),
                    label: const Text('Previsão do Tempo', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BrazilianClimatesPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.electric_bolt_sharp, color: Colors.teal),
                    iconAlignment: IconAlignment.start,
                    label: const Text('Climas do Brasil', style: TextStyle(fontSize: 16, color: Colors.black),),
                  ),
                ),
                const SizedBox(width: 30, height: 40.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherClimatePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.cloud, color: Colors.teal),
                    label: const Text('Tempo e Clima', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClimaticFactorsPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.beach_access_rounded, color: Colors.teal),
                    label: const Text('Fatores Climáticos', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 30, height: 40.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClimatePhenomenaPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.cyclone, color: Colors.teal),
                    label: const Text('Fenômenos Climáticos', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermsPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.newspaper_sharp, color: Colors.teal),
                    label: const Text('Termos de uso', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 30, height: 40.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.account_balance_wallet_rounded, color: Colors.teal),
                    label: const Text('Privacidade', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.account_balance_outlined, color: Colors.teal),
                    label: const Text('Sobre esse APP', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
