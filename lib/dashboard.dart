import 'package:flutter/material.dart';
import 'login_page.dart';
import 'routes.dart';
import 'weather.dart';
import 'scheduler.dart';
import 'notes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const avatar = Padding(
      padding: EdgeInsets.all(20),
       child: Hero(
       tag: 'logo',
       child: SizedBox(
         height: 160,
        )
      ),
    );
    final description = Padding(
      padding: const EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.justify,
        text: const TextSpan(
          text: 'Hello!',
          style: TextStyle(color: Colors.black, fontSize: 20)
        ),
      ),
    );
    final chooseRoute = TextButton(
        style: TextButton.styleFrom(
              side: const BorderSide(width: 2, color: Colors.black),
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 30)),
          child: const Text('Routes'),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Routes()));
      }
    );
    final weather = TextButton(
      style: TextButton.styleFrom(
              side: const BorderSide(width: 2, color: Colors.black),
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 30)),
          child: const Text('Weather'),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Weather()));
      }
    );
    final scheduler = TextButton(
        style: TextButton.styleFrom(
              side: const BorderSide(width: 2, color: Colors.black),
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 30)),
          child: const Text('Scheduler'),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Scheduler()));
      }
    );
    final notes = TextButton(
      style: TextButton.styleFrom(
              side: const BorderSide(width: 2, color: Colors.black),
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 30)),
          child: const Text('Notes'),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Notes()));
      }
    );
    final buttonLogout = TextButton(
      style: TextButton.styleFrom(
              side: const BorderSide(width: 1, color: Colors.red),
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.red,
              textStyle: const TextStyle(fontSize: 16)),
          child: const Text('Logout'),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              avatar,
              description,
              chooseRoute,
              weather,
              scheduler,
              notes,
              buttonLogout
            ],
          ),
        ),
      )
    );
  }
}