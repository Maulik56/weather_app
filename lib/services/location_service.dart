import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Location permissions are denied.');
        // _showDialog(
        //     'Permission Denied', 'Location permissions are denied. Please allow permissions.');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      debugPrint('Location permissions are permanently denied.');
      // _showDialog('Permission Denied', 'Location permissions are permanently denied.');
      return Future.error('Location permissions are permanently denied.');
    }
    if (!serviceEnabled) {
      debugPrint('Location services are disabled.');
      // _showDialog(
      //     'Location Error', 'Location services are disabled. Please enable them in settings.');
      return Future.error('Location services are disabled.');
    }
    try {
      return await Geolocator.getCurrentPosition();
    } on PlatformException catch (e) {
      debugPrint('Failed to get the current location: ${e.toString()}');
      // _showDialog('Location Error', 'Failed to obtain location: ${e.message}');
      return Future.error('Failed to obtain location: ${e.message}');
    }
  }

  // void _showDialog(String title, String content) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(title),
  //         content: Text(content),
  //         actions: <Widget>[
  //           InkWell(
  //             onTap: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
