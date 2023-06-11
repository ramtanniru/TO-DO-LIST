import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 0,
        // ),
        body: Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover))),
        Container(
          alignment: AlignmentDirectional(0, -0.4),
          child: Text(
            'VIT-AP',
            style: TextStyle(
              fontSize: 60,
              color: Colors.white,
              fontFamily: 'Limelight',
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional(0, -0.7),
          child: Image.asset(
            'assets/images/logo.png',
            height: 120,
            width: 120,
          ),
        ),
        Container(
          alignment: AlignmentDirectional(0, 1),
          child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: AlignmentDirectional(0, 1),
                          child: Text(
                            'Welcome to',
                            style: TextStyle(
                              fontFamily: 'Limelight',
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          )),
                      Container(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'VIT-AP',
                          style: TextStyle(
                              fontFamily: 'Limelight',
                              fontSize: 35,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.82,
                        child: InkWell(
                          child: Card(
                            //margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 10, 50, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Let's get started ",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ],
    ));
  }
}
