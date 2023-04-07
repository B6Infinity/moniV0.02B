// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:moni/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
