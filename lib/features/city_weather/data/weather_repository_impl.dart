import 'package:weather_app/features/city_weather/data/weather_repository.dart';

import 'package:weather_app/features/city_weather/data/service/weather_service.dart';

import '../models/weather.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl(this.service);
  WeatherService service;

  @override
  Future<Weather> getCityWeather(String cityName) async {
    return await service.updateWeatherByCity(cityName);
  }
}
