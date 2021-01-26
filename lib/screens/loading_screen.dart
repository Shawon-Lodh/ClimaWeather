import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../screens/location_screen.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  // _LoadingScreenState createState() => _LoadingScreenState();
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
    // int condition = weatherData['weather'][0]['id'];
    // double temperature = weatherData['main']['temp'];
    // String cityName = weatherData['name'];
    // print(condition);
    // print(temperature);
    // print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
