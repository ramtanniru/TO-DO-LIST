import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vit_ap/services/google_auth.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  google_auth g_auth = google_auth();
  Color side = Colors.white;
  bool onTouch = true;
  void _signInWithGoogle() async {
    bool success = await g_auth.signInWithGoogle();
    if (success) {
      Navigator.pushReplacementNamed(context, '/home_1');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Authentication Failed'),
            content: Text('Failed to sign in with Google.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _saveData() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String username = usernameController.text.trim();
    try {
      await usersCollection.add({
        'email': email,
        'password': password,
        'username': username,
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('User data saved successfully.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to save user data.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        centerTitle: true,
        backgroundColor: Color(0xff654AFF),
        elevation: 0,
      ),
      body: Stack(children: [
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
        Stack(children: <Widget>[
          Positioned(
            top: 350,
            left: 0,
            right: 0,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      side = (onTouch) ? Color(0xff654AFF) : Colors.white;
                      onTouch = false;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: side),
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
                            labelText: 'email',
                          ),
                        ),
                      ),
                    ),
                    //),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      side = (onTouch) ? Color(0xff654AFF) : Colors.white;
                      onTouch = false;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      side = (onTouch) ? Color(0xff654AFF) : Colors.white;
                      onTouch = false;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
                            labelText: 'password',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
