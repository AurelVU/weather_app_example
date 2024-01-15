import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/city_weather/domain/weather_cubit.dart';

class CityWeatherScreen extends StatefulWidget {
  const CityWeatherScreen({
    required this.cityName,
    super.key,
  });

  final String cityName;

  @override
  State<CityWeatherScreen> createState() => _CityWeatherScreenState();
}

class _CityWeatherScreenState extends State<CityWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.data.current.tempC.toString()),
              Text(state.data.current.feelslikeC.toString()),
            ],
          );
        }
        return const Center(
          child: Text('Извините, что-то пошло не так'),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<WeatherCubit>();
      cubit.updateWeatherByCity(widget.cityName);
    });
  }
}
