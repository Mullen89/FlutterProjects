import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '*****************************';  //commented out for privacy.
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
const openWeatherCityURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        URL: '$openWeatherCityURL?q=$cityName&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        URL:
            '$openWeatherURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();
    return weatherData;
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
    if (temp > 77) {
      return 'It\'s 🍦 time';
    } else if (temp > 60) {
      return 'Time for shorts and 👕';
    } else if (temp < 45) {
      return 'You\'ll need a 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
