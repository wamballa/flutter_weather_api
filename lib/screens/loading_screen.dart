import 'dart:convert';
// import 'dart:html';
import 'package:flutter_weather/screens/location_screen.dart';
import 'package:flutter_weather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _latitude;
  double _longitude;

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();

    _latitude = location.latitude;
    _longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
      url: Uri.https(
        'api.openweathermap.org',
        'data/2.5/weather',
        {
          'lat': _latitude.toString(),
          'lon': _longitude.toString(),
          'units': 'metric',
          'appid': ''
        },
      ),
    );
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: weatherData,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('INIT STATE');
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          size: 100,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
