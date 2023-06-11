import 'package:flutter/material.dart';

class home_1 extends StatefulWidget {
  const home_1({super.key});

  @override
  State<home_1> createState() => _home_1State();
}

class _home_1State extends State<home_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional(0, 0.15),
            child: Text('Index'),
          ),
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'settings'),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'settings'),
        // BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'settings'),
      ]),
    );
  }
}
