import 'package:flutter/material.dart';
import 'package:fast_qr_web_scan/screens/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  } 
}
