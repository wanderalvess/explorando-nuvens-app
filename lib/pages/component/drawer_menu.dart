import 'package:flutter/material.dart';
import 'package:clouds_identification_tab/pages/about_page.dart';
import 'package:clouds_identification_tab/pages/brazilian_climates_page.dart';
import 'package:clouds_identification_tab/pages/climate_phenomena_page.dart';
import 'package:clouds_identification_tab/pages/climatic_factors_page.dart';
import 'package:clouds_identification_tab/pages/exploring_clouds_page.dart';
import 'package:clouds_identification_tab/pages/home_page.dart';
import 'package:clouds_identification_tab/pages/privacy_page.dart';
import 'package:clouds_identification_tab/pages/terms_page.dart';
import 'package:clouds_identification_tab/pages/weather_climate_page.dart';
import 'package:clouds_identification_tab/pages/weather_forecast_page.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          buildListTile(context, 'Início', HomePage()),
          buildListTile(context, 'Explorando as Nuvens', const ExploringCloudsPage()),
          buildListTile(context, 'Previsão do Tempo', WeatherForecastPage()),
          buildListTile(context, 'Climas do Brasil', BrazilianClimatesPage()),
          buildListTile(context, 'Tempo e Clima', WeatherClimatePage()),
          buildListTile(context, 'Fatores Climáticos', ClimaticFactorsPage()),
          buildListTile(context, 'Fenômenos Climáticos', ClimatePhenomenaPage()),
          buildListTile(context, 'Termos de Uso', const TermsPage()),
          buildListTile(context, 'Privacidade', const PrivacyPage()),
          buildListTile(context, 'Sobre', AboutPage()),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Fecha o Drawer
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
