import 'dart:convert';
import 'package:clouds_identification_tab/model/my_image.dart';
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
  String _temp = ''; //temperatura atual
  String _description = ''; //descrição do tempo
  String _cloudiness = ''; //nebulosidade
  String _rain = ''; //volume de chuva
  String _currently = ''; //dia ou noite
  String _wind_speedy = ''; //velocidade vento
  String _wind_cardinal = ''; //rosa dos ventos
  String _condition_slug = ''; //imagem da condição do tempo,
  String _weekday = ''; //dia da semana
  String _date = ''; //data
  String _temp_min = '';
  String _temp_max = '';
  String _humidity = '';
  String _image_url = '';

  Future<void> _getWeatherForecast(String city) async {
    final apikeyHG = '14193a96';
    final apiUrlHG =
        'https://api.hgbrasil.com/weather?key=$apikeyHG&city_name=$city';
    final responseHG = await http.get(Uri.parse(apiUrlHG));

    if (responseHG.statusCode == 200) {
      final jsonData = jsonDecode(responseHG.body);
      setState(() {
        _city = jsonData['results']['city'];
        _temp = jsonData['results']['temp'].toString();
        _temp_max = jsonData['results']['forecast'][0]['max'].toString();
        _temp_min = jsonData['results']['forecast'][0]['min'].toString();
        _weekday = jsonData['results']['forecast'][0]['weekday'];
        _date = jsonData['results']['forecast'][0]['date'].toString();
        _humidity = jsonData['results']['humidity'].toString();
        _description = jsonData['results']['description'];
        _cloudiness = jsonData['results']['cloudiness'].toString();
        _rain = jsonData['results']['rain'].toString();
        _currently = jsonData['results']['currently'];
        _wind_speedy = jsonData['results']['wind_speedy'].toString();
        _wind_cardinal = jsonData['results']['wind_cardinal'].toString();
        _condition_slug = jsonData['results']['condition_slug'];
      });
      getImageWeatherUrls(_condition_slug);
    } else {
      setState(() {
        _city = 'Erro ao obter a cidade';
        _temp = 'Erro ao obter a temperatura';
      });
    }
  }

  Future<void> getImageWeatherUrls(String conditionSlug) async {
    final response = await http.get(Uri.parse(
        'https://back-app-clouds.onrender.com/api/image/images/weather?name=$conditionSlug'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        _image_url = data[0]['imageUrl'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do tempo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                },
                child: Text('Consultar'),
              ),
              SizedBox(height: 16.0),
              Visibility(
                visible: _city != null && _city.isNotEmpty,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _city,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              _date,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temperatura',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$_temp°C',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16), // Adiciona um espaçamento entre as colunas
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Nebulosidade',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      _cloudiness.replaceAll('.', ',') + '%',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            const Text(
                              'Descrição do Tempo:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _description,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Spacer(), // Adiciona um espaço flexível entre as colunas
                        Image.network(
                          _image_url,
                          height: 100,
                          scale: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
