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
              'Welcome!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 400,
            child: ListView(children: [
              Container(
                alignment: AlignmentDirectional(0, 0.1),
                child: InkWell(
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
                            labelText: 'email',
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/signin');
                  },
                ),
              ),
              Container(
                alignment: AlignmentDirectional(0, 0.3),
                child: InkWell(
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
                  onTap: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                ),
              ),
              Container(
                alignment: AlignmentDirectional(0, 0.5),
                child: InkWell(
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
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/signin');
                  },
                ),
              ),
              Container(
                alignment: AlignmentDirectional(0, 0.7),
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
                        'Sign in',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Color(0xff654AFF),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/home_1');
                  },
                ),
              ),
              Container(
                alignment: AlignmentDirectional(0, 0.85),
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
                          ))
                    ]),
              ),
              Container(
                alignment: AlignmentDirectional(0, 0.9),
                width: 300,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: Color(0xff252525),
                      )),
                      Text(
                        'OR',
                        style: TextStyle(color: Color(0xff654AFF)),
                      ),
                      Expanded(
                          child: Divider(
                        color: Color(0xff252525),
                      )),
                    ]),
              )
            ]),
          ),
        ]));
  }
}
