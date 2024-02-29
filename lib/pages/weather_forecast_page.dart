import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherForecastPage extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecastPage> {
  TextEditingController _cityController = TextEditingController();
  String _city = '';
  String _defaultCity = '';
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
  String _image_url = 'https://i.postimg.cc/j5twKdYd/cloud.png';

  @override
  void initState() {
    super.initState();
    _getWeatherForecastForDefaultCity(); // Chama o método ao criar a página
  }

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
        _city = 'Goiânia, GO';
        _temp = '30';
        _date = '27/02';
        _condition_slug = 'cloudly_day';
        _description = 'Poucas nuvens';
        _cloudiness = '40.0';
        _temp_max = '30';
        _temp_min = '20';
        _wind_speedy = '8.8 km/h';
      });
      getImageWeatherUrls(_condition_slug);
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

  Future<void> _saveDefaultCity(BuildContext context, String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('default_city', city);

    // Exibindo um diálogo de alerta para o usuário
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cidade padrão cadastrada com sucesso'),
        backgroundColor: Colors.blue,
      ),
    );
  }

// Função para obter a previsão do tempo usando a cidade padrão
  Future<void> _getWeatherForecastForDefaultCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String defaultCity = prefs.getString('default_city') ?? '';
    if (defaultCity.isNotEmpty) {
      _getWeatherForecast(defaultCity);
      print(defaultCity);
    } else {
      print('Nenhuma cidade padrão definida.');
    }
  }

// Exemplo de uso da cidade salva
  Future<void> _exemploUsoCidadeSalva() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String defaultCity = prefs.getString('default_city') ?? '';
    if (defaultCity.isNotEmpty) {
      print('Cidade padrão: $defaultCity');
    } else {
      print('Nenhuma cidade padrão definida.');
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _getWeatherForecast(_cityController.text);
                    },
                    child: Text('Consultar'),
                  ),
                  SizedBox(width: 16),
                  Visibility(
                    visible: _city != null && _city.isNotEmpty,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _saveDefaultCity(context, _city);
                          },
                          child: Text('Salvar como padrão'),
                        ),
                      ],
                    ),
                  ),
                ],
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
                                fontSize: 18,
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
                                      'Temperatura:',
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
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Nebulosidade:',
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
                        const Spacer(),
                        Expanded(
                          child: Image.network(
                            _image_url,
                            height: 100,
                          ),
                        )
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
