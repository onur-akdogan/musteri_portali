import 'package:flutter/material.dart';
import 'package:musteri_portali/login_page.dart';
//import 'package:musteri_portali/miktar.dart';
import 'tmbarsiv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
