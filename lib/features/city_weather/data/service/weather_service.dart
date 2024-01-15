import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/weather.dart';

part 'weather_service.g.dart';

@RestApi()
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET('/v1/current.json')
  Future<Weather> updateWeatherByCity(@Query('q') String city);
}
