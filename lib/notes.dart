import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

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
          text: 'Notes stuff.',
          style: TextStyle(color: Colors.black, fontSize: 20)
        ),
      ),
    );

    final buttonLogout = TextButton(
      child: const Text('Logout', style: TextStyle(color: Colors.black87, fontSize: 16),),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    );

    final toDashboard = TextButton(
      child: const Text('Back', style: TextStyle(color: Colors.black87, fontSize: 24),),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));
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
              toDashboard,
              buttonLogout
            ],
          ),
        ),
      )
    );
  }
}