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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explorando o Clima'),
        backgroundColor: Colors.indigo,
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
                          builder: (context) => ExploringCloudsPage(),
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
                          builder: (context) => BrazilianClimatesPage(),
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
                          builder: (context) => WeatherClimatePage(),
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
                          builder: (context) => ClimaticFactorsPage(),
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
                          builder: (context) => ClimatePhenomenaPage(),
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
                          builder: (context) => PrivacyPage(),
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
                          builder: (context) => AboutPage(),
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
