import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home_2 extends StatefulWidget {
  final String username;

  const Home_2({Key? key, required this.username}) : super(key: key);

  @override
  State<Home_2> createState() => _Home_2State();
}

class _Home_2State extends State<Home_2> {
  late CollectionReference<Map<String, dynamic>> userCollections;
  TextEditingController _textFieldController = TextEditingController();
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    userCollections =
        FirebaseFirestore.instance.collection('users/${widget.username}/tasks');
    _read();
  }

  void _create(String task) {
    userCollections
        .add({'task': task})
        .then((value) => print('Task added'))
        .catchError((error) => print('Failed to add task: $error'));
  }

  void _read() {
    userCollections
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      setState(() {
        tasks = querySnapshot.docs
            .map((doc) =>
                (doc.data() as Map<String, dynamic>)['task']?.toString() ?? '')
            .toList();
      });
    });
  }

  void _update(String taskId, String newTask) {
    userCollections
        .doc(taskId)
        .update({'task': newTask})
        .then((value) => print('Task updated'))
        .catchError((error) => print('Failed to update task: $error'));
  }

  void _delete(String taskId) {
    userCollections
        .doc(taskId)
        .delete()
        .then((value) => print('Task deleted'))
        .catchError((error) => print('Failed to delete task: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        centerTitle: true,
        backgroundColor: Color(0xff654AFF),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: userCollections.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            tasks = snapshot.data!.docs
                .map((doc) => doc.data()['task']?.toString() ?? '')
                .toList();

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = tasks[index];
                return Card(
                  child: ListTile(
                    title: Text(task),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showEditDialog(task, index, snapshot);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _delete(snapshot.data!.docs[index].id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff654AFF),
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: 'Enter task'),
          ),
          actions: <Widget>[
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xff654AFF)),
              child: Text('Add'),
              onPressed: () {
                String task = _textFieldController.text.trim();
                if (task.isNotEmpty) {
                  _create(task);
                  _textFieldController.clear();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(String task, int index,
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    TextEditingController _editTextFieldController =
        TextEditingController(text: task);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(
            controller: _editTextFieldController,
            decoration: InputDecoration(hintText: 'Enter task'),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Update'),
              onPressed: () {
                String newTask = _editTextFieldController.text.trim();
                if (newTask.isNotEmpty) {
                  String taskId = snapshot.data!.docs[index].id;
                  _update(taskId, newTask);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
