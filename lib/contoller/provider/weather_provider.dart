import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/weather_model.dart';
import '../../utils/helpers.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;

  Future<WeatherModel?> Weatherdata() async {
    _weatherModel =
    await APIHelper.apiHelper.fetchweather();
    return _weatherModel;
  }
}
