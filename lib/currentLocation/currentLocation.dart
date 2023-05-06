import 'dart:async';
import 'dart:convert';
import 'package:courier_rider/utility/config.dart';
import 'package:courier_rider/utility/localdb.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:web_socket_client/web_socket_client.dart';

class CurrentLocation extends ChangeNotifier {
  void currentLocationAction() async {
    final socket = WebSocket(Uri.parse(WebSocketURl));

    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    ).listen((Position? position) {
      if (position != null && LocalDB.getUID != null) {
        socket.send(json.encode({
          "rider_id": LocalDB.getUID,
          "latitude": position.latitude,
          "longitude": position.longitude
        }));
        print(socket.connection.state);
      }
    });
  }
}
