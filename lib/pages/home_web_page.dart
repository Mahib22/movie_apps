import 'package:flutter/material.dart';
import 'package:movie_apps/components/header.dart';
import 'package:movie_apps/theme.dart';

class HomeWebPage extends StatefulWidget {
  @override
  _HomeWebPageState createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: Center(
            child: Container(
              width: 700,
              child: Header(),
            ),
          ),
        ),
      ),
    );
  }
}
