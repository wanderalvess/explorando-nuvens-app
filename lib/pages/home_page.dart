import 'package:clouds_identification_tab/pages/about.dart';
import 'package:clouds_identification_tab/pages/brazilian_climates.dart';
import 'package:clouds_identification_tab/pages/climate_phenomena.dart';
import 'package:clouds_identification_tab/pages/climatic_factors.dart';
import 'package:clouds_identification_tab/pages/component/drawer_menu.dart';
import 'package:clouds_identification_tab/pages/exploring_clouds_page.dart';
import 'package:clouds_identification_tab/pages/privacy_page.dart';
import 'package:clouds_identification_tab/pages/terms_page.dart';
import 'package:clouds_identification_tab/pages/weather_climate.dart';
import 'package:clouds_identification_tab/pages/weather_forecast_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explorando Nuvens'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.network(
            //     'https://i.postimg.cc/bJ97m8dJ/altocumulus-lenticularis.jpg'),
            const SizedBox(height: 16),
            const Text(
              'Bem-vindo ao Explorando Nuvens!',
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
                          builder: (context) => ExploringClouds(),
                        ),
                      );
                    },
                    icon: Icon(Icons.explore),
                    label: const Text('Explorar Nuvens', style: TextStyle(fontSize: 16),),

                  ),
                ),
                SizedBox(width: 9),
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
                    icon: Icon(Icons.sunny),
                    label: const Text('Previsão do Tempo', style: TextStyle(fontSize: 15),),
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
                          builder: (context) => BrazilianClimates(),
                        ),
                      );
                    },
                    icon: Icon(Icons.electric_bolt_sharp),
                    label: const Text('Climas do Brasil', style: TextStyle(fontSize: 16),),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherClimate(),
                        ),
                      );
                    },
                    icon: Icon(Icons.cloud),
                    label: const Text('Tempo e Clima', style: TextStyle(fontSize: 16)),
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
                          builder: (context) => ClimaticFactors(),
                        ),
                      );
                    },
                    icon: Icon(Icons.beach_access_rounded),
                    label: const Text('Fatores Climáticos', style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(width: 8),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClimatePhenomena(),
                        ),
                      );
                    },
                    icon: Icon(Icons.cyclone),
                    label: const Text('Fenômenos Climáticos', style: TextStyle(fontSize: 16)),
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
                          builder: (context) => TermsPage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.newspaper_sharp),
                    label: const Text('Termos de uso', style: TextStyle(fontSize: 16),),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.account_balance_wallet_rounded),
                    label: const Text('Privacidade', style: TextStyle(fontSize: 16)),
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
                          builder: (context) => About(),
                        ),
                      );
                    },
                    icon: Icon(Icons.account_balance_outlined),
                    label: const Text('Sobre esse APP', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
