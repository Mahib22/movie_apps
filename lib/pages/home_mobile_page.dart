import 'package:flutter/material.dart';
import 'package:movie_apps/components/header.dart';
import 'package:movie_apps/theme.dart';

class HomeMobilePage extends StatefulWidget {
  @override
  _HomeMobilePageState createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Header(),
      ),
    );
  }
}
