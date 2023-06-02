import 'package:flutter/material.dart';

class login_1 extends StatefulWidget {
  const login_1({super.key});

  @override
  State<login_1> createState() => _login_1State();
}

class _login_1State extends State<login_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
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
            Container(
              alignment: AlignmentDirectional(0, -0.1),
              child: Text(
                'Welcome back!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: AlignmentDirectional(0, 0.11),
              child: InkWell(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Color(0xffF8F7F7),
                  child: Container(
                    width: 350,
                    height: 50,
                    alignment: AlignmentDirectional(-0.7, 0),
                    child: Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xffA6A6A6),
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
              alignment: AlignmentDirectional(0, 0.31),
              child: InkWell(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Color(0xffF8F7F7),
                  child: Container(
                    width: 350,
                    height: 50,
                    alignment: AlignmentDirectional(-0.7, 0),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xffA6A6A6),
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
                    Expanded(child: Divider()),
                  ]),
            )
          ],
        ));
  }
}
