import 'dart:io';

import 'package:test_app/objects/Weather.dart';

class RouteInfo {
  String routeName = '';
  String fromLocation = '';
  String toLocation = '';
  //Future<WeatherData>? weatherData;

  RouteInfo(String name, String from, String to) {
    routeName = name;
    fromLocation = from;
    toLocation = to;
    //weatherData =
    //fetchWeatherData(Platform.environment['WEATHER_API_KEY'], 44.34, 10.99);
    String? secretKey = Platform.environment['WEATHER_API_KEY'];
    if (secretKey != null) {
      print('GitHub secret value: $secretKey');
      // Now you can use the secretKey in your code
    } else {
      print('GitHub secret not found');
    }
  }
}
