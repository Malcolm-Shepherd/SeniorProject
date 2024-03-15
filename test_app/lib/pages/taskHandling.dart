import 'package:test_app/objects/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';

import 'package:test_app/pages/jobInfo.dart';

Map<DateTime, List<Event>> events = {};

Future<List<Map<String, dynamic>>> loadMockData() async {
  // Get the json data from MOCK_SITE_JOBS.json
  String jsonStr = await rootBundle.loadString('mock_data/MOCK_JOBS.json');
  //
  List<dynamic> jsonList = json.decode(jsonStr);
  //

  return jsonList.cast<Map<String, dynamic>>();
}

class TaskHandling extends StatefulWidget {
  const TaskHandling({super.key});

  @override
  State<TaskHandling> createState() => _TasksState();
}

DateTime _focusedDay = DateTime.now();

class _TasksState extends State<TaskHandling> {
  DateTime? _selectedDay = DateTime.now();
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
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
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

  return Expanded(
    child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          if (data![index]["date"].toString() ==
              '${_focusedDay.month}/${_focusedDay.day}/${_focusedDay.year}') {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Job Title"),
                    subtitle: Text(
                      data[index]["job_title"].toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  ListTile(
                    title: Text("Date:"),
                    subtitle: Text(data[index]["date"].toString()),
                  ),
                  ListTile(
                    title: const Text("Clearances:"),
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blueAccent),
                      child: Text(data[index]["clearances"].toString())),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                JobDisplay()), // Use MaterialPageRoute to navigate to a new screen
                      );
                    },
                    child: const Text('Click to open job'),
                  )
                ],
              ),
            );
          } else
            return Container();
        }),
  );
}
