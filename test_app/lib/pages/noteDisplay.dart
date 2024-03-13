import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/objects/Location.dart';

final List<LocationInfo> locations = <LocationInfo>[
  LocationInfo('Some Location', 1),
  LocationInfo('This Location', 2),
  LocationInfo('This Location', 3),
  LocationInfo('This Location', 4),
  LocationInfo('This Location', 5)
];

Future<List<Map<String, dynamic>>> loadMockData() async {
  // Get the json data from MOCK_SITE_LOCATION.json
  String jsonStr = await rootBundle.loadString('mock_data/MOCK_NOTE.json');
  //
  List<dynamic> jsonList = json.decode(jsonStr);
  //
  return jsonList.cast<Map<String, dynamic>>();
}

List<Map<String, dynamic>> dataList = [];

class NoteDisplay extends StatelessWidget {
  final Map<String, dynamic> note;
  final int id;
  const NoteDisplay({Key? key, required this.id, required this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: Text(
          note['title'],
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: noteCard(note),
    );
  }

  Widget noteCard(Map<String, dynamic> data) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(minWidth: 4000),
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.grey[900],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Note Title:",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              note['title'].toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const Row(
              children: [
                Text(
                  "\nPriority: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              note['priority'].toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const Text("\nNote Contents: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              note['content'],
              style: const TextStyle(color: Colors.white),
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
