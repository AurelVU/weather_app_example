import 'package:flutter/material.dart';
import 'package:weather_app/features/city_weather/view/city_input/city_input_screen.dart';
import 'package:weather_app/features/city_weather/view/city_weather_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  if (settings.name == '/') {
    return MaterialPageRoute(builder: (context) => const CityInputScreen());
  } else if (settings.name == '/cityWeatherScreen') {
    return MaterialPageRoute(
      builder: (context) => CityWeatherScreen(
        cityName: settings.arguments as String,
      ),
    );
  }
  throw Exception('Unknown router');
}
