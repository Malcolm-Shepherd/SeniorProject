import 'package:flutter/material.dart';
import 'package:test_app/objects/Route.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class RouteDisplay extends StatefulWidget {
  const RouteDisplay({super.key, required this.route});

  final RouteInfo route;

  @override
  State<RouteDisplay> createState() => _RouteDisplayState();
}

class _RouteDisplayState extends State<RouteDisplay> {
  Position? _currPos;
  final mapController = MapController();
  void _getCurrentPos() async {
    Position position = await _determinePosition();
    setState(() {
      _currPos = position;
    });
    mapController.moveAndRotate(
        new LatLng(position.latitude, position.longitude), 17, 0);
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: Text(
          widget.route.routeName,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _getCurrentPos,
          )
        ],
      ),
      // Mapping widget
      body: FlutterMap(
        mapController: mapController,
        options: const MapOptions(
          initialCenter: LatLng(51.509364, -0.128928),
          initialZoom: 10,
          maxZoom: 20,
          minZoom: 1,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          // Row used to display data on top of map widget
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(color: Colors.grey[900]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Column 1 used to display temporary data
                          Column(children: [
                            Text(
                              "21.6 mi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text("Distance",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10))
                          ]),
                          Column(children: [
                            Text(
                              "${widget.route.weatherType}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text("Weather",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10))
                          ])
                        ],
                      ),
                      // Column 2 used to display temporary data
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(children: [
                              Text(
                                "76.8",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text("Tempature",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10))
                            ]),
                            Column(children: [
                              Text(
                                "Bad",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text("Road Conditions",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10))
                            ])
                          ]),
                      // Column 3 used to display temporary data
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(children: [
                              Text(
                                "6:58",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text("ETA",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10))
                            ]),
                            Column(children: [
                              Text(
                                "6:00",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text("Time of departure",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10))
                            ])
                          ])
                    ]),
              ),
            ]),
          ])
        ],
      ),
    );
  }
}
