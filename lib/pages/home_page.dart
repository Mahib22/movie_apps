import 'package:flutter/material.dart';
import 'package:movie_apps/pages/home_mobile_page.dart';
import 'package:movie_apps/pages/home_web_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 700) {
          return HomeMobilePage();
        } else {
          return HomeWebPage();
        }
      },
    );
  }
}
