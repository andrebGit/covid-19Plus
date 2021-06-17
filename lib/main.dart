import 'package:flutter/material.dart';
import 'componets/barBotton.dart';
import 'pages/indexApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'COVID-19 Plus';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.cyan[600],
        /*  bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey[900],
        ), */

        // Define the default font family.
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Color(0Xffe0e0e0),
          ),
        ),
      ),
      //
      home: Scaffold(
        bottomNavigationBar: BarBotton(),
        body: SingleChildScrollView(
          child: IndexApp(),
        ),
      ),
    );
  }
}
