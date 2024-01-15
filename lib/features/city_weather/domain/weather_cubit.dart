import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/weather_repository.dart';
import '../models/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.repository) : super(WeatherLoading());

  WeatherRepository repository;

  Future<void> updateWeatherByCity(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await repository.getCityWeather(city);
      emit(WeatherData(weather));
    } catch (_) {
      emit(WeatherError());
      rethrow;
    }
  }
}
