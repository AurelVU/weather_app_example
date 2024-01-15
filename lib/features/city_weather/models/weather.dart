import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'current.dart';
import 'location.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  @JsonSerializable(fieldRename:FieldRename.snake)
  const factory Weather({
    required Location location,
    required Current current,
  }) = _Weather;



  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}