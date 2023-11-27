import 'package:flutter/material.dart';

final List<String> approvedRoutes = <String>['Route A', 'Route B', 'Route  C'];

class Driver extends StatelessWidget {
  const Driver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Page"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Please select a route'),
            Container(
              width: 500,
              height: 100,
              child: ListView.builder(
                  itemCount: approvedRoutes.length,
                  itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onTap: () => {Navigator.pop(context)},
                          leading: Icon(Icons.drive_eta),
                          title: Text('Route: ${approvedRoutes[index]}'),
                        ),
                      )),
            )
          ]),
    );
  }
}
