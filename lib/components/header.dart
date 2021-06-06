import 'package:flutter/material.dart';
import 'package:movie_apps/components/card_movie.dart';
import 'package:movie_apps/model/movie_place.dart';
import 'package:movie_apps/theme.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<MoviePlace> resultSearch = [];

  @override
  void initState() {
    resultSearch = moviePlaceList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(20),
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/icon.png',
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Text(
                'IndoMovie',
                style: blackTextStyle.copyWith(
                  color: whiteColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            onChanged: (query) {
              setState(() {
                if (query.length < 1) {
                  resultSearch = moviePlaceList;
                } else {
                  resultSearch = moviePlaceList
                      .where((item) => item.title
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .toList();
                }
              });
            },
            cursorColor: blackColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: greyColor,
              prefixIcon: Icon(
                Icons.search_outlined,
                color: blackColor,
              ),
              hintText: 'Cari Film...',
              hintStyle: TextStyle(
                color: blackColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: greyColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: greyColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: greyColor,
                ),
              ),
            ),
          ),
        ),
        CardMovie(
          searchResult: resultSearch,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
