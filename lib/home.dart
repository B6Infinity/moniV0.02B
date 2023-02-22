// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moni/pages/accountant.dart';
import 'package:moni/pages/recorder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // VARS

  List<Widget> PAGES = [Recorder(), Accountant()];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PAGES[currentPageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60,
        items: const <Widget>[
          Icon(Icons.fiber_manual_record_rounded, size: 30),
          Icon(Icons.data_thresholding_rounded, size: 30),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        buttonBackgroundColor: Colors.blue,
        animationDuration: const Duration(milliseconds: 200),
        color: Colors.black38,
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
      ),
    );
  }
}
