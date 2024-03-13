import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/objects/Location.dart';
import 'package:test_app/pages/newNote.dart';
import 'package:test_app/pages/noteDisplay.dart';

Future<List<Map<String, dynamic>>> loadMockData() async {
  // Get the json data from MOCK_SITE_LOCATION.json
  String jsonStr = await rootBundle.loadString('mock_data/MOCK_NOTE.json');
  //
  List<dynamic> jsonList = json.decode(jsonStr);
  //
  return jsonList.cast<Map<String, dynamic>>();
}

List<Map<String, dynamic>> dataList = [];

class NotesDisplay extends StatelessWidget {
  final int id;
  const NotesDisplay({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          "Notes Menu",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewNote()),
              )
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: loadMockData(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is loading
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If an error occurred
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            // If data is successfully loaded
            return ListViewBuilder(snapshot.data!);
          } else {
            // If none of the above conditions met, show a generic error
            return const Center(child: Text("Unknown Error"));
          }
        },
      ),
    );
  }

  Widget ListViewBuilder(List<Map<String, dynamic>>? data) {
    data ??= [];

    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          if (data![index]['site_id'] == id) {
            // If the ID matches, return the GestureDetector with routeButton
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NoteDisplay(id: id, note: data![index])),
                );
              },
              child: noteCard(data[index]),
            );
          } else {
            // If the ID doesn't match, return null
            return Container();
          }
        });
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
            data[index]['title'].toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(children: [
            const Text(
              "Priority: ",
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              data[index]['priority'].toString(),
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
              data['title'].toString(),
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
              data['priority'].toString(),
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
              data['content'],
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
