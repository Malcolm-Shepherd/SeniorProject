import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          if (data![index]['site_id'] == 1) {
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
              child: Container(),
            );
            // If the ID doesn't match, return null
            return Container();
          }
        });
  }
}
