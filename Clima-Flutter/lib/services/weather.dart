import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'location.dart';
import 'networking.dart';

class WeatherModel {
  final String url = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = DotEnv().env['API_KEY'];

  Future<Map<String, dynamic>> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url: '$url?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey');

    return networkHelper.getData();
  }

  Future<Map<String, dynamic>> getCityWeather(String cityName) {
    return NetworkHelper(url: '$url?q=$cityName&units=metric&appid=$apiKey')
        .getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
