import 'package:flutter/material.dart';
import 'package:vit_ap/services/google_auth.dart';
import 'package:vit_ap/services/fb_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  google_auth g_auth = google_auth();
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

  fb_auth fbAuth = fb_auth();
  void _signInWithFb() async {
    try {
      bool success = await fbAuth.signInWithFb();
      if (success) {
        Navigator.pushReplacementNamed(context, '/home_1');
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Authentication Failed'),
              content: Text('Failed to sign in with Facebook.'),
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
    } catch (e) {
      print('Facebook authentication error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff654AFF),
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional(0, -0.61),
            child: Image.asset(
              'assets/images/login-2.png',
              height: 380,
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            alignment: AlignmentDirectional(-1, -1.33),
            child: Image.asset(
              'assets/images/login-1.png',
              height: 430,
              width: double.maxFinite,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            child:
                Image.asset('assets/images/logo.png', height: 100, width: 100),
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
          Container(
            alignment: AlignmentDirectional(0, -0.1),
            child: Text(
              'Welcome !',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: AlignmentDirectional(0, 0.12),
            child: InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color(0xff654AFF),
                child: Container(
                  width: 350,
                  height: 50,
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/signin');
              },
            ),
          ),
          Container(
            alignment: AlignmentDirectional(0, 0.33),
            child: InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff654AFF), width: 1.5),
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Container(
                  width: 350,
                  height: 50,
                  alignment: AlignmentDirectional(0, 0),
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
          Center(
            child: Container(
              alignment: AlignmentDirectional(0, 0.55),
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: _signInWithFb,
                    icon: Image.asset('assets/icons/facebook.png'),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: _signInWithGoogle,
                    icon: Image.asset('assets/icons/google.png'),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/twitter.png'),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/github2.png'),
                    iconSize: 30,
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional(0, 0.65),
            child: Text(
              'Sign in with another account',
              style: TextStyle(color: Color(0xff4F4F4F), fontSize: 13),
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
