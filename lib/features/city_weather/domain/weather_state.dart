part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherData extends WeatherState {
  WeatherData(this.data);

  final Weather data;
}

class WeatherError extends WeatherState {

}
