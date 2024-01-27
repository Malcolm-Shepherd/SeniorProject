// import 'package:flutter/material.dart';
// import 'package:test_app/objects/Location.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// final List<LocationInfo> routes = <LocationInfo>[
//   LocationInfo('Some Route', 'Sunny', 'Location 1', 'Location 2'),
//   LocationInfo('This Route', 'Rainy', 'Location 2', 'Location 3'),
//   LocationInfo('This Route', 'Rainy', 'Location 3', 'Location 4'),
//   LocationInfo('This Route', 'Rainy', 'Location 4', 'Location 5'),
//   LocationInfo('This Route', 'Rainy', 'Location 5', 'Location 6'),
//   LocationInfo('This Route', 'Rainy', 'Location 6', 'Location 7'),
//   LocationInfo('This Route', 'Rainy', 'Location 7', 'Location 8'),
//   LocationInfo('This Route', 'Rainy', 'Location 8', 'Location 9'),
//   LocationInfo('Some Route', 'Sunny', 'Location 1', 'Location 2'),
//   LocationInfo('This Route', 'Rainy', 'Location 2', 'Location 3'),
//   LocationInfo('This Route', 'Rainy', 'Location 3', 'Location 4'),
//   LocationInfo('This Route', 'Rainy', 'Location 4', 'Location 5'),
//   LocationInfo('This Route', 'Rainy', 'Location 5', 'Location 6'),
//   LocationInfo('This Route', 'Rainy', 'Location 6', 'Location 7'),
//   LocationInfo('This Route', 'Rainy', 'Location 7', 'Location 8'),
//   LocationInfo('This Route', 'Rainy', 'Location 8', 'Location 9')
// ];

// class Driver extends StatelessWidget {
//   const Driver({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[500],
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         centerTitle: true,
//         backgroundColor: Colors.grey[900],
//         title: const Text(
//           "Routes Menu",
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.list),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: ListView.builder(
//           itemCount: routes.length,
//           itemBuilder: (context, index) => GestureDetector(
//               onTap: () => {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Scaffold()))
//                   },
//               child: routeButton(index))),
//     );
//   }

//   Card routeButton(int index) {
//     return Card(
//       elevation: 8,
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       child: Container(
//         decoration: BoxDecoration(color: Colors.grey[900]),
//         child: ListTile(
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//           leading: Container(
//             padding: const EdgeInsets.only(right: 12.0),
//             decoration: const BoxDecoration(
//                 border:
//                     Border(right: BorderSide(width: 1, color: Colors.white))),
//             child: const Icon(Icons.business),
//           ),
//           title: Text(
//             routes[index].routeName,
//             style: const TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Row(children: [
//             Text(
//               routes[index].fromLocation,
//               style: const TextStyle(color: Colors.white),
//             ),
//             const Icon(Icons.linear_scale, color: Colors.yellowAccent),
//             Text(
//               routes[index].toLocation,
//               style: const TextStyle(color: Colors.white),
//             )
//           ]),
//           trailing: const Icon(
//             Icons.keyboard_arrow_right,
//             color: Colors.white,
//             size: 30,
//           ),
//         ),
//       ),
//     );
//   }
// }
