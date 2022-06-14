import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey = 'd93b68a8e378907522c63b1fabf0c5e5';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  //for getting weather data of main location screen
  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  //for getting weather data of city screen
  Future getCityWeather(String cityName) async {
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int id) {
    String icon='';
    if (id >=200 && id<300) {
      icon= '🌩';
    } else if (id>=300 && id<500 ) {
      icon= '🌦';
    } else if (id>=500 && id<600 ) {
      icon= '⛈';
    } else if (id>=600 && id<700) {
      icon= '❄';
    } else if (id>=700 && id<800) {
      icon= '🌫';
    } else if (id==800) {
      icon= '🌤';
    } else if (id>800) {
      icon= '☁';
    }
    return icon;
  }

  String getMessage(String msg) {
    String message=msg;
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
    return capitalize(message);
  }
}
