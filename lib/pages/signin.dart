import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign in'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              alignment: AlignmentDirectional(0, -0.71),
              child: Image.asset(
                'assets/images/login-2.png',
                height: 300,
                width: double.maxFinite,
              ),
            ),
            Container(
              alignment: AlignmentDirectional(-1, -1.03),
              child: Image.asset(
                'assets/images/login-1.png',
                height: 300,
                width: double.maxFinite,
              ),
            ),
            Container(
              child: Image.asset('assets/images/logo.png',
                  height: 100, width: 100),
              alignment: AlignmentDirectional(0, -0.9),
            ),
            Container(
              child: Text(
                'VIT-AP',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Limelight',
                  fontSize: 50,
                ),
              ),
              alignment: AlignmentDirectional(0, -0.6),
            ),
          ],
        ));
  }
}
