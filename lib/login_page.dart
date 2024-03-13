import 'package:flutter/material.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: const EdgeInsets.all(20),
        child: Hero(
        tag: 'hero',
        child: CircleAvatar(
          radius: 56.0,
          child: Image.asset('assets/air-force-symbol.png'),
        )
      ),
    );
    final inputUsername = Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          )
        ),
      ),
    );
    final inputPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          )
        ),
      ),
    );
    final buttonLogin = Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: ElevatedButton(
          child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));
            }
        ),
      ),
    );
    const buttonForgotPassword = TextButton(
      onPressed: null,
      child: Text('Forgot Password', style: TextStyle(color: Colors.grey, fontSize: 16),)
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              logo,
              inputUsername,
              inputPassword,
              buttonLogin,
              buttonForgotPassword
            ],
          ),
        ),
      )
    );
  }
}