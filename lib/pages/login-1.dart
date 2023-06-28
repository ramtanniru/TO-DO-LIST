import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:vit_ap/pages/signin.dart';
import 'package:vit_ap/services/login_auth.dart';
import 'Home-2.dart';

class login_1 extends StatefulWidget {
  const login_1({super.key});

  @override
  State<login_1> createState() => _login_1State();
}

class _login_1State extends State<login_1> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  CollectionReference authorize =
      FirebaseFirestore.instance.collection('credentials');

  void _validate() {
    String u_name = usernameController.text.trim();
    String password = passwordController.text.trim();
    authorize.doc(u_name).get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
        print(data);
        if (data != null) {
          if (data['password'] == password) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home_2(username: u_name),
              ),
            );
          }
          ;
        } else {
          print('password error-1');
        }
      } else {
        print('password error');
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Color(0xff654AFF),
          elevation: 0,
        ),
        body: SafeArea(
          child: Stack(children: [
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
              left: 30,
              right: 30,
              child: Column(children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(0xffF8F7F7),
                  child: Container(
                    width: 350,
                    height: 50,
                    alignment: AlignmentDirectional(-0.7, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          labelText: 'username',
                        ),
                      ),
                    ),
                  ),
                  //),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(0xffF8F7F7),
                  child: Container(
                    width: 350,
                    height: 50,
                    alignment: AlignmentDirectional(-0.7, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          labelText: 'password',
                        ),
                      ),
                    ),
                  ),
                  //),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
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
                  onTap: _validate,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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
                Container(
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
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/signin');
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Color(0xff654AFF)),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ]),
        ));
  }
}
