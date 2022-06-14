import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
   int temperature=0;
   String city='';
   String weatherIcon='';
   String weatherMsg='';
   String searchCity='';
   int weatherId=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData==null){
        temperature=0;
        city='';
        weatherIcon="Error";
        weatherMsg= 'Could not fetch data';
        return;
      }

      double temp= weatherData['main']['temp'];
      temperature=temp.toInt();
      city=weatherData['name'];
      weatherMsg=weatherData['weather'][0]['description'];
      weatherId=weatherData['weather'][0]['id'];
      weatherIcon=weather.getWeatherIcon(weatherId);
      weatherMsg=weather.getMessage(weatherMsg);
    });
}


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Weather",
                style: kAppBarTextStyle,
              ),
              backgroundColor: Colors.cyan[400],
              centerTitle: true,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          "$temperature°", //temperature
                          textAlign: TextAlign.center,
                          style: kTemperatureStyle,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: kTemperatureBoxDecoration,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: Text(
                        "$weatherIcon", //weather Emoji
                        style: kWeatherIconStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: kWeatherIconBoxDecoration,
                  ),
                )
              ],
            )),
            SizedBox(
              height: 7,
            ),
            Expanded(
                child: Container(
              child: Center(
                child: FittedBox(
                  child: Text(
                    "$weatherMsg in $city",
                    textAlign: TextAlign.center,
                    style: kWeatherMessage,
                    softWrap: true,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              decoration: kWeatherMessageBoxDecoration,
            )),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    child: Align(
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: kTextFieldInputDecoration,
                        textAlign: TextAlign.center,
                        onChanged: (value){
                          searchCity=value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Center(
                    child: ElevatedButton(
                  onPressed: () async{
                    var cityWeatherData=await WeatherModel().getCityWeather('$searchCity');
                    updateUI(cityWeatherData);
                  },
                  child: kSearchIcon,
                  style: kSearchIconButtonStyle,
                )),
                SizedBox(width: 5),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    updateUI(widget.locationWeather);
                  },
                  child: kLocationIcon,
                  style: kLocationIconButtonStyle,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
