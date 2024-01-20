import 'package:flutter/material.dart';
import 'package:test_app/objects/Location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NotesDisplay extends StatelessWidget {
  const NotesDisplay({super.key});

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
      body: Container(),
    );
  }
}
