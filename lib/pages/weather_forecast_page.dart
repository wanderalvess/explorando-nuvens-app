import 'package:clouds_identification_tab/pages/weather_forecast_screeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Previsão do Tempo',
      home: WeatherForecastScreen(),
    );
  }

}