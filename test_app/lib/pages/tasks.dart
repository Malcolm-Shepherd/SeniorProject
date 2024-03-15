import 'package:test_app/objects/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';

Map<DateTime, List<Event>> events = {};

Future<List<Map<String, dynamic>>> loadMockData() async {
  // Get the json data from MOCK_SITE_JOBS.json
  String jsonStr = await rootBundle.loadString('mock_data/MOCK_NOTE.json');
  //
  List<dynamic> jsonList = json.decode(jsonStr);
  //

  return jsonList.cast<Map<String, dynamic>>();
}

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime? _selectedDay = DateTime.now();
  DateTime? _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          "Task Menu",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          Container(
            child: FutureBuilder(
              future: loadMockData(),
              builder: (context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While data is loading
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // If an error occurred
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  // If data is successfully loaded
                  return ListViewBuilder2(snapshot.data!);
                } else {
                  // If none of the above conditions met, show a generic error
                  return const Center(child: Text("Unknown Error"));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget ListViewBuilder2(List<Map<String, dynamic>>? data) {
  data ??= [];

  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container();
      });
}
