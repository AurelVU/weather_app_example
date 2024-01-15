import '../models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getCityWeather(String cityName);
}
