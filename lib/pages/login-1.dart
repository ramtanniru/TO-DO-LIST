import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:vit_ap/services/login_auth.dart';
import 'Home-2.dart';

class login_1 extends StatefulWidget {
  const login_1({Key? key});

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
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Incorrect Password'),
                  content: Text('Please enter the correct password.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Incorrect Username'),
                content: Text('Please enter the correct username.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Data doesn't exist"),
              content: Text('Please enter a valid username.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Color(0xff654AFF),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginbg-2.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                  SizedBox(height: 16),
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
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'username',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
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
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xff654AFF),
                          width: 1.5,
                        ),
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
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
