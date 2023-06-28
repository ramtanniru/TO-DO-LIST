import 'package:flutter/material.dart';
import 'package:vit_ap/firebase_options.dart';
import 'package:vit_ap/pages/home.dart';
import 'package:vit_ap/pages/log_in.dart';
import 'package:vit_ap/pages/login-1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vit_ap/pages/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => Log_in(),
        '/signin': (context) => Sign_in(),
        '/login_1': (context) => login_1(),
      },
    );
  }
}
