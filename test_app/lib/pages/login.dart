import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 600,
              height: 500,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Center(
                  child: Text(
                "Welcome, please login!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w200),
              )),
            ),
            Container(
              width: 400,
              height: 500,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
    );
  }
}
