import 'package:explorando_clima_app/data/data.dart';
import 'package:explorando_clima_app/pages/NewNewHomePage/home_section_page.dart';
import 'package:explorando_clima_app/pages/about_page.dart';
import 'package:explorando_clima_app/pages/brazilian_climates_page.dart';
import 'package:explorando_clima_app/pages/climate_phenomena_page.dart';
import 'package:explorando_clima_app/pages/climatic_factors_page.dart';
import 'package:explorando_clima_app/pages/exploring_clouds_page.dart';
import 'package:explorando_clima_app/pages/newPages/explore_climate.dart';
import 'package:explorando_clima_app/pages/newPages/profile_screen.dart';
import 'package:explorando_clima_app/pages/privacy_page.dart';
import 'package:explorando_clima_app/pages/terms_page.dart';
import 'package:explorando_clima_app/pages/weather_climate_page.dart';
import 'package:explorando_clima_app/pages/weather_forecast_page.dart';
import 'package:flutter/material.dart';

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
              icon: Icon(Icons.cloud),
              label: 'Tipos de Nuvens',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive),
              label: 'Trips',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
        body: [
          const ExploreClimate(),
          HomeSectionPage(
            title: 'Tipos de Nuvens',
            buttons: [
              buildButton(context, 'Explorar Nuvens', Icons.explore, ExploringCloudsPage()),
              buildButton(context, 'Previsão do Tempo', Icons.sunny, WeatherForecastPage()),
            ],
          ),
          HomeSectionPage(
            title: 'Explorando o Clima',
            buttons: [
              buildButton(context, 'Climas do Brasil', Icons.electric_bolt_sharp, BrazilianClimatesPage()),
              buildButton(context, 'Tempo e Clima', Icons.cloud, WeatherClimatePage()),
              buildButton(context, 'Fatores Climáticos', Icons.beach_access_rounded, ClimaticFactorsPage()),
              buildButton(context, 'Fenômenos Climáticos', Icons.cyclone, ClimatePhenomenaPage()),
            ],
          ),
          HomeSectionPage(
            title: 'Sobre',
            buttons: [
              buildButton(context, 'Termos de Uso', Icons.newspaper_sharp, TermsPage()),
              buildButton(context, 'Privacidade', Icons.account_balance_wallet_rounded, PrivacyPage()),
              buildButton(context, 'Sobre esse APP', Icons.account_balance_outlined, AboutPage()),
            ],
          ),
          const ProfileScreen(profile: zachProfile),
        ][navBarIndex],
      ),
    );
  }
}
