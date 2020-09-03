import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/screen/input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: InputScreen(),
    ),
    );
  }
}
