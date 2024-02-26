import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class WeatherForecastPage extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecastPage> {
  TextEditingController _cityController = TextEditingController();
  String _city = '';
  String _temp = '';
  String _temp_min = '';
  String _temp_max = '';
  String _humidity = '';
  String _pressure = '';

  Future<void> _getWeatherForecast(String city) async {
    final apikey = '90e3cc1e43979f2c222283e3a78f6126';
    final apikeyHG = '14193a96';
    final apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric';
    final apiUrlHG = 'https://api.hgbrasil.com/weather?key=$apikeyHG&city_name=$city';
    final response = await http.get(Uri.parse(apiUrl));




   // if do openweather

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _city = jsonData['name'];
        _temp = jsonData['main']['temp'].toString();
        _temp_max = jsonData['main']['temp_max'].toString();
        _temp_min = jsonData['main']['temp_min'].toString();
        _pressure = jsonData['main']['pressure'].toString();
        _humidity = jsonData['main']['humidity'].toString();
      });
    } else {
      setState(() {
        _city = 'Erro ao obter a cidade';
        _temp = 'Erro ao obter a temperatura';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Previsão do tempo'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'Digite o nome da cidade',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _getWeatherForecast(_cityController.text);
                }, child: Text('Consultar'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Temperatura para $_city: é $_temp °C',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
    );
  }
}