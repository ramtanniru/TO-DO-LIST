import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vit_ap/pages/Home-2.dart';
import 'package:vit_ap/services/google_auth.dart';
import 'package:vit_ap/services/fb_auth.dart';

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  google_auth g_auth = google_auth();
  void _signInWithGoogle() async {
    bool success = await g_auth.signInWithGoogle();
    if (success) {
      // Navigator.pushReplacementNamed(context, '/home_2');
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore db = FirebaseFirestore.instance;

      final String uid = auth.currentUser!.uid;
      db.collection('users').doc(uid);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home_2(username: uid),
        ),
      );
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
        final FirebaseAuth auth = FirebaseAuth.instance;
        final FirebaseFirestore db = FirebaseFirestore.instance;

        final String uid = auth.currentUser!.uid;
        db.collection('users').doc(uid);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home_2(username: uid),
          ),
        );
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
      body: Container(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginbg-2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'VIT-AP',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Limelight',
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome !',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
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
              SizedBox(
                height: 20,
              ),
              Container(
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
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
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
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  'Sign in with another account',
                  style: TextStyle(color: Color(0xff4F4F4F), fontSize: 13),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
