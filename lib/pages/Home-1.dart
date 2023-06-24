import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class home_1 extends StatefulWidget {
  const home_1({Key? key}) : super(key: key);

  @override
  State<home_1> createState() => _home_1State();
}

class _home_1State extends State<home_1> {
  CollectionReference userCollections =
      FirebaseFirestore.instance.collection('users');

  List<String> cardData = [];

  void _create() {
    userCollections.add({'name': 'New Card'}).then((_) {
      print('Card created successfully.');
    }).catchError((error) {
      print('Error creating card: $error');
    });
  }

  void _read() {
    userCollections.get().then((QuerySnapshot querySnapshot) {
      List<String> data = [];
      querySnapshot.docs.forEach((doc) {
        data.add((doc.data() as Map<String, dynamic>)['name'] ?? '');
      });

      setState(() {
        cardData = data;
      });
    }).catchError((error) {
      print('Error retrieving data from Firestore: $error');
    });
  }

  void _update() {
    if (cardData.isNotEmpty) {
      String cardId = cardData[0];
      userCollections.doc(cardId).update({'name': 'Updated Card'}).then((_) {
        print('Card updated successfully.');
      }).catchError((error) {
        print('Error updating card: $error');
      });
    }
  }

  void _delete() {
    if (cardData.isNotEmpty) {
      String cardId = cardData[0];
      userCollections.doc(cardId).delete().then((_) {
        print('Card deleted successfully.');
        setState(() {
          cardData.removeAt(0);
        });
      }).catchError((error) {
        print('Error deleting card: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Color(0xff654AFF),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home_2');
              }, //_create,
              child: Text('create'),
            ),
            ElevatedButton(
              onPressed: _read,
              child: Text('read'),
            ),
            ElevatedButton(
              onPressed: _update,
              child: Text('update'),
            ),
            ElevatedButton(
              onPressed: _delete,
              child: Text('delete'),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cardData[index]),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Edit button action
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                // Delete button action
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'home',
            activeIcon: Icon(Icons.abc_outlined),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'add',
            activeIcon: Icon(Icons.access_alarm),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
