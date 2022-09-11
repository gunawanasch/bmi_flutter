import 'package:bmi_flutter/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

import 'constants/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: primaryColor),
          titleTextStyle: TextStyle(color: primaryColor),
          backgroundColor: Colors.white,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const BmiDataScreen(),
    );
  }
}