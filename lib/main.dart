import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/features/city_weather/data/weather_repository.dart';
import 'package:weather_app/features/city_weather/data/weather_repository_impl.dart';
import 'package:weather_app/features/city_weather/data/service/weather_service.dart';
import 'package:weather_app/features/city_weather/domain/weather_cubit.dart';

import 'logger.dart';
import 'navigation.dart';
import 'util/auth_interceptor.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async => runApp(const MyApp()),
    (error, stackTrace) => logger.e(error.toString(), stackTrace: stackTrace),
  );
}

bool isDevelop = false;

final _dio = Dio(BaseOptions(
  baseUrl: baseUrl,
))
  ..interceptors.addAll([
    AuthInterceptor(),
    PrettyDioLogger(),
  ]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherRepository>(
          create: (BuildContext context) {
            return WeatherRepositoryImpl(WeatherService(_dio));
          },
        ),
        Provider<WeatherCubit>(
          create: (context) => WeatherCubit(context.read()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
