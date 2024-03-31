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

  String _descriptionNextDay = '';
  String _dateNextDay = '';
  String _cloudinessNextDay = '';
  String _weekdayNextDay = '';
  String _imageUrlNextDay = '';
  String _tempMinNextDay = '';
  String _tempMaxNextDay = '';
  String _conditionNextDay = ''; //imagem da condição do tempo,
  String _windSpeedyNextDay = ''; //velocidade vento


  String _rain = ''; //volume de chuva
  String _currently = ''; //dia ou noite
  String _windSpeedy = ''; //velocidade vento
  String _windCardinal = ''; //rosa dos ventos
  String _condition = ''; //imagem da condição do tempo,
  String _weekday = ''; //dia da semana
  String _date = ''; //data
  String _tempMin = '';
  String _tempMax = '';
  String _humidity = '';
  String _imageUrl = '';
  bool _isFavorite = false;

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
        _tempMax = jsonData['results']['forecast'][0]['max'].toString();
        _tempMin = jsonData['results']['forecast'][0]['min'].toString();
        _weekday = jsonData['results']['forecast'][0]['weekday'];
        _date = jsonData['results']['forecast'][0]['date'].toString();
        _condition = jsonData['results']['forecast'][0]['condition'];


        _tempMaxNextDay = jsonData['results']['forecast'][1]['max'].toString();
        _tempMinNextDay = jsonData['results']['forecast'][1]['min'].toString();
        _weekdayNextDay = jsonData['results']['forecast'][1]['weekday'];
        _dateNextDay = jsonData['results']['forecast'][1]['date'].toString();
        _descriptionNextDay = jsonData['results']['forecast'][1]['description'].toString();
        _cloudinessNextDay = jsonData['results']['forecast'][1]['cloudiness'].toString();
        _conditionNextDay = jsonData['results']['forecast'][1]['condition'];
        _windSpeedyNextDay = jsonData['results']['forecast'][1]['wind_speedy'];


        _humidity = jsonData['results']['humidity'].toString();
        _description = jsonData['results']['description'];
        _cloudiness = jsonData['results']['cloudiness'].toString();
        _rain = jsonData['results']['rain'].toString();
        _currently = jsonData['results']['currently'];
        _windSpeedy = jsonData['results']['wind_speedy'].toString();
        _windCardinal = jsonData['results']['wind_cardinal'].toString();
      });
      getImageWeatherUrls(_condition, _conditionNextDay);
    } else {
      setState(() {
        _city = 'Goiânia, GO';
        _temp = '30';
        _date = '27/03';
        _condition = 'cloudly_day';
        _description = 'Poucas nuvens';
        _cloudiness = '40.0';
        _tempMax = '30';
        _tempMin = '20';
        _windSpeedy = '8.8 km/h';
        _imageUrl =
            'https://back-app-clouds.onrender.com/api/image/images/weather?name=cloudly_day';
      });
    }
  }

  Future<void> getImageWeatherUrls(
      String condition, String conditionNextDay) async {
    final response = await http.get(Uri.parse(
        'https://back-app-clouds.onrender.com/api/image/images/weather?name=$condition'));
    final responseNextDay = await http.get(Uri.parse(
        'https://back-app-clouds.onrender.com/api/image/images/weather?name=$conditionNextDay'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<dynamic> dataNextDay = json.decode(responseNextDay.body);
      setState(() {
        _imageUrl = data[0]['imageUrl'].toString();
        _imageUrlNextDay = dataNextDay[0]['imageUrl'].toString();
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
        backgroundColor: Colors.indigo,
      ),
    );
  }

// Função para obter a previsão do tempo usando a cidade padrão
  Future<void> _getWeatherForecastForDefaultCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String defaultCity = prefs.getString('default_city') ?? 'Goiânia, GO';
    if (defaultCity.isNotEmpty) {
      _getWeatherForecast(defaultCity);
      print(defaultCity);
    } else {
      print('Nenhuma cidade padrão definida.');
    }
  }

  void _showCitySearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Digite o nome da cidade'),
          content: TextField(
            controller: _cityController,
            decoration: InputDecoration(
              hintText: 'Nome da cidade',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _getWeatherForecast(_cityController.text);
              },
              child: Text('Consultar'),
            ),
            // Botão de estrela para definir a cidade como padrão
            IconButton(
              icon: Icon(
                _isFavorite ? Icons.star : Icons.star_border,
                color: _isFavorite
                    ? Colors.yellow
                    : null, // Altere a cor do ícone com base no estado _isFavorite
              ),
              onPressed: () {
                setState(() {
                  _isFavorite =
                      !_isFavorite; // Alternar o estado _isFavorite ao pressionar o botão
                  if (_isFavorite) {
                    _saveDefaultCity(
                        context,
                        _cityController
                            .text); // Salvar a cidade se o botão for pressionado
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do tempo'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Mostrar o campo de texto para digitar o nome da cidade
              _showCitySearchDialog(context);
            },
          ),
        ],
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
              SizedBox(height: 8),
              const Text(
                'Previsão de hoje',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
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
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$_date  |',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16),
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
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temp. Max.:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$_tempMax°C',
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
                                      'Temp. Min.:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$_tempMin°C',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Veloc. do vento:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                    _windSpeedy,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Direção do vento:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      _windCardinal,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),Row(
                              children: [
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
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Umidade do Ar:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      _humidity.replaceAll('.', ',')+'%',
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
                        SizedBox(height: 16.0),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut,
                                alignment: Alignment.center,
                                child: _imageUrl.isEmpty
                                    ? CircularProgressIndicator()
                                    : Image.network(
                                        _imageUrl.isEmpty ? '' : _imageUrl,
                                        height: 80,
                                        width: 75,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              const Text(
                'Previsão próximo dia',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
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
                          children: [Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$_dateNextDay  |',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16),
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
                                ],
                              ),
                            ],
                          ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temp. Max.:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$_tempMaxNextDay°C',
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
                                      'Temp. Min.:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$_tempMinNextDay°C',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Veloc. do vento:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      _windSpeedyNextDay,
                                      style: const TextStyle(
                                        fontSize: 18,
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
                                      _cloudinessNextDay.replaceAll('.', ',') + '%',
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
                              _descriptionNextDay,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut,
                                alignment: Alignment.center,
                                child: _imageUrlNextDay.isEmpty
                                    ? CircularProgressIndicator()
                                    : Image.network(
                                        _imageUrlNextDay.isEmpty
                                            ? ''
                                            : _imageUrlNextDay,
                                        height: 80,
                                        width: 75,
                                      ),
                              ),
                            ],
                          ),
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
