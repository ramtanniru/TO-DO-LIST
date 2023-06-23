import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:vit_ap/pages/signin.dart';
import 'package:vit_ap/services/login_auth.dart';

class login_1 extends StatefulWidget {
  const login_1({super.key});

  @override
  State<login_1> createState() => _login_1State();
}

class _login_1State extends State<login_1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Color(0xff654AFF),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/login-2.png',
                height: 420,
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/login-1.png',
                height: 300,
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              child: Image.asset(
                'assets/images/logo.png',
                height: 100,
                width: 100,
              ),
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
              child: Text(
                'VIT-AP',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Limelight',
                  fontSize: 50,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Welcome back!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 350,
            left: 0,
            right: 0,
            child: Container(
              width: 350,
              height: 50,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Username',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 430,
            left: 30,
            right: 30,
            child: Container(
              width: 350,
              height: 50,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Color(0xff654AFF),
                          style: BorderStyle.solid,
                          width: 2.0),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 550,
            left: 30,
            right: 30,
            child: InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xff654AFF), width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Container(
                  width: 350,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Color(0xff654AFF),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/login_1');
              },
            ),
          ),
          Positioned(
            top: 650,
            left: 0,
            right: 0,
            child: Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Color(0xff252525),
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(color: Color(0xff654AFF)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xff252525),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 700,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New user?',
                    style: TextStyle(
                      color: Color(0xff4F4F4F),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Color(0xff4F4F4F)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
