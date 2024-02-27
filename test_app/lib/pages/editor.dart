import 'package:flutter/material.dart';
import 'package:test_app/objects/Route.dart';
import 'package:test_app/pages/routeDisplay.dart';
import 'package:test_app/pages/routeEditor.dart';
import 'package:test_app/pages/labels.dart';

final List<String> approvedRoutes = <String>['Route A', 'Route B', 'Route  C'];
final List<RouteInfo> routes = <RouteInfo>[
  RouteInfo('Some Route', 'Sunny', 'Location 1', 'Location 2'),
  RouteInfo('This Route', 'Rainy', 'Location 2', 'Location 3')
  // RouteInfo('This Route', 'Rainy', 'Location 3', 'Location 4'),
  // RouteInfo('This Route', 'Rainy', 'Location 4', 'Location 5'),
  // RouteInfo('This Route', 'Rainy', 'Location 5', 'Location 6'),
  // RouteInfo('This Route', 'Rainy', 'Location 6', 'Location 7'),
  // RouteInfo('This Route', 'Rainy', 'Location 7', 'Location 8'),
  // RouteInfo('This Route', 'Rainy', 'Location 8', 'Location 9'),
  // RouteInfo('Some Route', 'Sunny', 'Location 1', 'Location 2'),
  // RouteInfo('This Route', 'Rainy', 'Location 2', 'Location 3'),
  // RouteInfo('This Route', 'Rainy', 'Location 3', 'Location 4'),
  // RouteInfo('This Route', 'Rainy', 'Location 4', 'Location 5'),
  // RouteInfo('This Route', 'Rainy', 'Location 5', 'Location 6'),
  // RouteInfo('This Route', 'Rainy', 'Location 6', 'Location 7'),
  // RouteInfo('This Route', 'Rainy', 'Location 7', 'Location 8'),
  // RouteInfo('This Route', 'Rainy', 'Location 8', 'Location 9')
];

class Editor extends StatelessWidget {
  static final TextEditingController fromController = TextEditingController();
  static final TextEditingController toController = TextEditingController();
  static LocationLabel? selectedFrom;
  static LocationLabel? selectedTo;
  const Editor({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          "Routes Menu",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 500,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Please select\n a route below:",
                        style: TextStyle(
                            fontSize: 35,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [DropdownMenu<LocationLabel>(
                          controller: fromController,
                          label: const Text("From", selectionColor: Colors.black),
                          textStyle: const TextStyle(
                              color: Colors.white
                          ),
                          onSelected: (LocationLabel? location){
                            selectedFrom = location;
                          },
                          dropdownMenuEntries:
                          LocationLabel.values.map<DropdownMenuEntry<LocationLabel>>(
                                (LocationLabel location) {
                              return DropdownMenuEntry<LocationLabel>(
                                  value: location,
                                  label: location.label
                              );
                            },
                          ).toList(),
                        ),
                          DropdownMenu<LocationLabel>(
                            controller: toController,
                            label: const Text("To", selectionColor: Colors.black),
                            textStyle: const TextStyle(
                                color: Colors.white
                            ),
                            onSelected: (LocationLabel? location){
                              selectedTo = location;
                            },
                            dropdownMenuEntries:
                            LocationLabel.values.map<DropdownMenuEntry<LocationLabel>>(
                                  (LocationLabel location) {
                                return DropdownMenuEntry<LocationLabel>(
                                    value: location,
                                    label: location.label
                                );
                              },
                            ).toList(),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_box_outlined),
                            onPressed:() => {
                              if(selectedFrom != null && selectedTo != null){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RouteEditor(route: RouteInfo("route", "weater", selectedFrom!.label,  selectedTo!.label))))
                              }
                            },
                          ),],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card routeButton(int index) {
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
            child: const Icon(Icons.fire_truck),
          ),
          title: Text(
            routes[index].routeName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(children: [
            Text(
              routes[index].fromLocation,
              style: const TextStyle(color: Colors.white),
            ),
            const Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(
              routes[index].toLocation,
              style: const TextStyle(color: Colors.white),
            )
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
