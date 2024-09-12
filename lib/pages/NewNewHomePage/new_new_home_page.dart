import 'package:explorando_clima_app/data/data.dart';
import 'package:explorando_clima_app/pages/NewNewHomePage/home_section_page.dart';
import 'package:explorando_clima_app/pages/about_page.dart';
import 'package:explorando_clima_app/pages/brazilian_climates_page.dart';
import 'package:explorando_clima_app/pages/climate_phenomena_page.dart';
import 'package:explorando_clima_app/pages/climatic_factors_page.dart';
import 'package:explorando_clima_app/pages/exploring_clouds_page.dart';
import 'package:explorando_clima_app/pages/newPages/explore_home.dart';
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
              icon: Icon(Icons.sunny),
              label: 'Previsão do Tempo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.terrain),
              label: 'Explorando o Clima',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Sobre',
            ),
          ],
        ),
        body: [
          const ExploreHome(),
          const ExploringCloudsPage(),
          WeatherForecastPage(),
          HomeSectionPage(
            title: 'Explorando o Clima',
            cards: [
              buildCard(context, 'Climas do Brasil', Icons.electric_bolt_sharp, const  BrazilianClimatesPage()),
              buildCard(context, 'Tempo e Clima', Icons.cloud, const WeatherClimatePage()),
              buildCard(context, 'Fatores Climáticos', Icons.beach_access_rounded, ClimaticFactorsPage()),
              buildCard(context, 'Fenômenos Climáticos', Icons.cyclone, ClimatePhenomenaPage()),
            ],
          ),
          HomeSectionPage(
            title: 'Sobre',
            cards: [
              buildCard(context, 'Termos de Uso', Icons.newspaper_sharp, const TermsPage()),
              buildCard(context, 'Privacidade', Icons.account_balance_wallet_rounded, const PrivacyPage()),
              buildCard(context, 'Sobre esse APP', Icons.account_balance_outlined, AboutPage()),
            ],
          ),
        ][navBarIndex],
      ),
    );
  }
}