import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validation_my1/validation.dart';

main(List<String> args) {
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
      home: ValidationView(),

      
    );
  }
}