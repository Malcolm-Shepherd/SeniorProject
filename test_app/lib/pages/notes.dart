import 'package:flutter/material.dart';
import 'package:test_app/objects/Location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_app/pages/noteDisplay.dart';

final List<LocationInfo> locations = <LocationInfo>[
  LocationInfo('Some Location', 1),
  LocationInfo('This Location', 2),
  LocationInfo('This Location', 3),
  LocationInfo('This Location', 4),
  LocationInfo('This Location', 5)
];

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          "locations Menu",
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
          itemCount: locations.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotesDisplay()))
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
            child: const Icon(Icons.domain),
          ),
          title: Text(
            locations[index].locationName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(children: [
            Text(
              locations[index].distance.toString(),
              style: const TextStyle(color: Colors.white),
            ),
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
