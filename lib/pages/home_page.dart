import 'package:clouds_identification_tab/pages/component/drawer_menu.dart';
import 'package:clouds_identification_tab/pages/exploring_clouds_page.dart';
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
            Image.asset('assets/images/ic_logo.png'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExploringClouds()),
                    );
                  },
                  icon: Icon(Icons.explore),
                  label: Text('Explorar Nuvens'),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeatherForecastPage()),
                    );
                  },
                  icon: Icon(Icons.sunny),
                  label: Text('Previsão do Tempo'),
                ),
              ],
            ),
            SizedBox(height: 16),
            const Text(
              'Bem-vindo ao Explorando Nuvens!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Outros textos informativos
          ],
        ),
      ),
    );
  }
}
