import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  Position _position;
  double longitude;
  double latitude;

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    try {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        print('Request permission = ' + permission.toString());
      }
      // print('service is enabled? ' + serviceEnabled.toString());
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        _position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = _position.latitude;
        longitude = _position.longitude;
        // print(_position.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
