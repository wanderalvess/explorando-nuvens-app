import 'package:clouds_identification_tab/pages/exploring_clouds_page.dart';
import 'package:clouds_identification_tab/pages/privacy_page.dart';
import 'package:clouds_identification_tab/pages/terms_page.dart';
import 'package:clouds_identification_tab/pages/weather_forecast_page.dart';
import 'package:flutter/cupertino.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Início'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            ListTile(
              title: Text('Explorando as Nuvens'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExploringClouds()),
                );
              },
            ),
            ListTile(
              title: Text('Previsão do Tempo'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherForecastPage()),
                );
              },
            ),
            ListTile(
              title: Text('Termos de uso'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Privacidade'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao Explorando Nuvens!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Este aplicativo foi desenvolvido para ajudar você a aprender mais sobre as diferentes formas de nuvens.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Você pode explorar vários tipos de nuvens, aprender um pouco mais sobre suas características.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Além disso, o aplicativo fornece informações sobre termos de uso e políticas de privacidade para garantir uma experiência segura e confiável.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
