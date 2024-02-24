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

// class _TasksState extends State<Tasks> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay = DateTime.now();
//   // Map<DateTime, List<Event>> events = {};
//   late final ValueNotifier<List<Event>> _selectedEvents;
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.landscapeRight,
//     ]);

//     void initState() {
//       super.initState();
//       loadMockData();
//     }

//     List<Event> _getEventForDay(DateTime day) {
//       return events[day] ?? [];
//     }

//     return Scaffold(
//       backgroundColor: Colors.grey[500],
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         centerTitle: true,
//         backgroundColor: Colors.grey[900],
//         title: const Text(
//           "Task Menu",
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.list),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: Row(
//         children: [
//           Container(
//             constraints: BoxConstraints(minWidth: 350),
//             child: FutureBuilder(
//               future: loadMockData(),
//               builder: (context,
//                   AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   // While data is loading
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   // If an error occurred
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 } else if (snapshot.hasData) {
//                   // If data is successfully loaded
//                   return ListViewBuilder(snapshot.data!);
//                 } else {
//                   // If none of the above conditions met, show a generic error
//                   return const Center(child: Text("Unknown Error"));
//                 }
//               },
//             ),
//           ),
//           Expanded(
//             child: Container(
//               constraints: BoxConstraints(maxHeight: 400),
//               decoration: BoxDecoration(color: Colors.white),
//               child: TableCalendar(
//                 firstDay: DateTime(
//                     _focusedDay.year, _focusedDay.month - 3, _focusedDay.day),
//                 lastDay: DateTime(
//                     _focusedDay.year, _focusedDay.month + 3, _focusedDay.day),
//                 focusedDay: _focusedDay,
//                 calendarFormat: _calendarFormat,
//                 selectedDayPredicate: (day) {
//                   // Use `selectedDayPredicate` to determine which day is currently selected.
//                   // If this returns true, then `day` will be marked as selected.

//                   // Using `isSameDay` is recommended to disregard
//                   // the time-part of compared DateTime objects.
//                   return isSameDay(_selectedDay, day);
//                 },
//                 onDaySelected: (selectedDay, focusedDay) {
//                   if (!isSameDay(_selectedDay, selectedDay)) {
//                     // Call `setState()` when updating the selected day
//                     setState(() {
//                       _selectedDay = selectedDay;
//                       _focusedDay = focusedDay;
//                     });
//                   }
//                 },
//                 onFormatChanged: (format) {
//                   if (_calendarFormat != format) {
//                     // Call `setState()` when updating calendar format
//                     setState(() {
//                       _calendarFormat = format;
//                     });
//                   }
//                 },
//                 onPageChanged: (focusedDay) {
//                   // No need to call `setState()` here
//                   _focusedDay = focusedDay;
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget ListViewBuilder(List<Map<String, dynamic>>? data) {
//     data ??= [];

//     return ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           if (true) {
//             // If the ID matches, return the GestureDetector with routeButton
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Text("data")));
//               },
//               child: Text("data"),
//             );
//           } else {
//             // If the ID doesn't match, return null
//             return Container();
//           }
//         });
//   }
// }
