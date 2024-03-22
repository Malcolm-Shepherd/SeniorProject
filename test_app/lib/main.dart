import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/pages/login.dart';
import 'package:test_app/pages/driver.dart';
import 'package:test_app/pages/locListDispay.dart';
import 'package:test_app/pages/taskHandling.dart';
import 'package:test_app/pages/tasks.dart';
import 'package:test_app/pages/editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Test",
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/driver': (context) => const Driver(),
        '/notes': (context) => const Notes(),
        '/tasks': (context) => const Tasks(),
        '/schedule': (context) => const TaskHandling(),
        '/editor': (context) => const Editor()
      },
    );
  }
}
