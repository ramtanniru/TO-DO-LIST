import 'package:flutter/material.dart';
import 'package:vit_ap/pages/Home-1.dart';
import 'package:vit_ap/pages/home.dart';
import 'package:vit_ap/pages/login-1.dart';
import 'package:vit_ap/pages/login.dart';
import 'package:vit_ap/pages/signin.dart';

void main() => runApp(MaterialApp(initialRoute: '/home', routes: {
      '/home': (context) => Home(),
      '/login': (context) => Login(),
      '/signin': (context) => Signin(),
      '/home_1': (context) => home_1(),
      '/login_1': (context) => login_1(),
    }));