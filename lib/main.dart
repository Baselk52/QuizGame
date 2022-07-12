import 'package:flutter/material.dart';
import 'package:untitled24/PlayersScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: Colors.white54,
        primarySwatch: Colors.blue,
      ),
      home: PlayersScreen()
    );
  }
}


