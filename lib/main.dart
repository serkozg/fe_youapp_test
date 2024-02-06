import 'package:flutter/material.dart';
import 'package:youapptest/login_page.dart';
import 'package:youapptest/profil_page.dart';
// @dart=2.9

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: LoginPage(),
      // home: ProfilPage(),
    );
  }
}
