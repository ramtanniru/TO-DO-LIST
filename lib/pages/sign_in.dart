import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Home-2.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('credentials');

  void _saveData() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String u_name = usernameController.text.trim();

    try {
      await usersCollection.doc(u_name).set({
        'email': email,
        'password': password,
        'username': u_name,
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home_2(username: u_name),
        ),
      );

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
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Sign in'),
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
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome !',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16,
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
                                controller: emailController,
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
                        SizedBox(
                          height: 16,
                        ),
                        Card(
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
                        SizedBox(
                          height: 16,
                        ),
                        Card(
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
                                obscureText: true,
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
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xff654AFF), width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Color(0xff654AFF),
                            child: Container(
                              width: 350,
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          onTap: _saveData,
                        ),
                      ]),
                ),
              )
            ])));
  }
}
