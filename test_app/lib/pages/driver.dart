import 'package:flutter/material.dart';
import 'package:test_app/objects/Route.dart';
import 'package:test_app/pages/routeDisplay.dart';

final List<String> approvedRoutes = <String>['Route A', 'Route B', 'Route  C'];
final List<RouteInfo> routes = <RouteInfo>[
  RouteInfo('Some Route', 'Location 1', 'Location 2'),
  RouteInfo('This Route', 'Location 2', 'Location 3'),
  RouteInfo('This Route', 'Location 3', 'Location 4'),
  RouteInfo('This Route', 'Location 4', 'Location 5'),
  RouteInfo('This Route', 'Location 5', 'Location 6'),
  RouteInfo('This Route', 'Location 6', 'Location 7'),
  RouteInfo('This Route', 'Location 7', 'Location 8'),
  RouteInfo('This Route', 'Location 8', 'Location 9'),
  RouteInfo('Some Route', 'Location 1', 'Location 2'),
  RouteInfo('This Route', 'Location 2', 'Location 3'),
  RouteInfo('This Route', 'Location 3', 'Location 4'),
  RouteInfo('This Route', 'Location 4', 'Location 5'),
  RouteInfo('This Route', 'Location 5', 'Location 6'),
  RouteInfo('This Route', 'Location 6', 'Location 7'),
  RouteInfo('This Route', 'Location 7', 'Location 8'),
  RouteInfo('This Route', 'Location 8', 'Location 9')
];

class Driver extends StatelessWidget {
  const Driver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          "Routes Menu",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
          itemCount: routes.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RouteDisplay(route: routes[index])))
                  },
              child: routeButton(index))),
    );
  }

  Card routeButton(int index) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[900]),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
                border:
                    Border(right: BorderSide(width: 1, color: Colors.white))),
            child: const Icon(Icons.fire_truck),
          ),
          title: Text(
            routes[index].routeName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(children: [
            Text(
              routes[index].fromLocation,
              style: const TextStyle(color: Colors.white),
            ),
            const Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(
              routes[index].toLocation,
              style: const TextStyle(color: Colors.white),
            )
          ]),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
