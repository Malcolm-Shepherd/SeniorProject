import 'package:flutter/material.dart';
import 'package:test_app/objects/Route.dart';

class RouteDisplay extends StatelessWidget {
  const RouteDisplay({super.key, required this.route});

  final RouteInfo route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: Text(
          route.routeName,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
