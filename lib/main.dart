import 'package:flutter/material.dart';
import 'package:vit_ap/firebase_options.dart';
import 'package:vit_ap/pages/Home-1.dart';
import 'package:vit_ap/pages/Home-2.dart';
import 'package:vit_ap/pages/home.dart';
import 'package:vit_ap/pages/login-1.dart';
import 'package:vit_ap/pages/login.dart';
import 'package:vit_ap/pages/signin-1.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/signin': (context) => Signin(),
        '/home_1': (context) => home_1(),
        '/login_1': (context) => login_1(),
        // '/home_2':(context) => Home_2(),
      },
    );
  }
}
