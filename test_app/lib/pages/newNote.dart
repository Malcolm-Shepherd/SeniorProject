import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

void writeToJSON(Map<String, dynamic> data, String filePath) async {
  // Convert data to JSON string
  String jsonString = jsonEncode(data);

  // Write JSON string to file
  File file = File(filePath);
  await file.writeAsString(jsonString);
}

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => NewNoteState();
}

class NewNoteState extends State<NewNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          "New Note",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Enter Note Title',
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Enter Note Title',
              ),
            ),
          ),
          Text(
            titleController
                .text, // Use titleController.text to display the entered text
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Map<String, dynamic> data = {
                'note_id': '1',
                'site_id': '1',
                'priority': '1',
                'title': titleController.text,
                'content': contentController.text,
              };
              print(data);
              writeToJSON(data, 'test_app/mock_data/MOCK_NOTE.json');
            },
            child: Text('TextButton'),
          )
        ],
      ),
    );
  }
}
