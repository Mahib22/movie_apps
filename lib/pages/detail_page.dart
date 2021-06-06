import 'package:flutter/material.dart';
import 'package:movie_apps/pages/detail_mobile_page.dart';
import 'package:movie_apps/pages/detail_web_page.dart';
import 'package:movie_apps/model/movie_place.dart';

class DetailPage extends StatelessWidget {
  final MoviePlace place;
  DetailPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 700) {
        return DetailWebPage(
          place: place,
        );
      } else {
        return DetailMobilePage(place: place);
      }
    });
  }
}
