import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/objects/Location.dart';
import 'package:test_app/pages/noteDisplay.dart';

final List<LocationInfo> locations = <LocationInfo>[
  LocationInfo('Some Location', 1),
  LocationInfo('This Location', 2),
  LocationInfo('This Location', 3),
  LocationInfo('This Location', 4),
  LocationInfo('This Location', 5)
];

Future<List<Map<String, dynamic>>> loadMockData() async {
  // Get the json data from MOCK_SITE_LOCATION.json
  String jsonStr =
      await rootBundle.loadString('mock_data/MOCK_SITE_LOCATION.json');
  //
  List<dynamic> jsonList = json.decode(jsonStr);
  //
  return jsonList.cast<Map<String, dynamic>>();
}

List<Map<String, dynamic>> dataList = [];

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
      body: FutureBuilder(
        future: loadMockData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot == null) {
              return Text("null data");
            } else if (snapshot.data != null) {
              return ListViewBuilder(snapshot.data);
            }
          } else {
            return Center(child: Text("Error with connection"));
          }

          return Center(child: Text("Error"));
        },
      ),
    );
  }

  Widget ListViewBuilder(List<Map<String, dynamic>>? data) {
    data ??= [];

    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NotesDisplay()))
                },
            child: routeButton(index, data)));
  }

  Card routeButton(int index, List<Map<String, dynamic>>? data) {
    data ??= [];

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
            data[index]['site_name'],
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(children: [
            Text(
              data[index]['location'],
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
