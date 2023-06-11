import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login_auth {
  final FirebaseAuth f_auth;
  login_auth(this.f_auth);
  Future<Object> login(String username, String password) async {
    try {
      await f_auth.signInWithEmailAndPassword(
          email: username, password: password);
      return 'Logged In';
    } catch (e) {
      return e;
    }
  }

  Future<Object> signin(String username, String email, String password) async {
    try {
      await f_auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user?.uid)
            .set({
          'uid': user?.uid,
          'email': email,
          'username': username,
          'password': password,
        });
      });
      return 'Signed in';
    } catch (e) {
      return e;
    }
  }
}
