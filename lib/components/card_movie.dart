import 'package:flutter/material.dart';
import 'package:movie_apps/pages/detail_page.dart';
import 'package:movie_apps/model/movie_place.dart';
import 'package:movie_apps/theme.dart';

class CardMovie extends StatelessWidget {
  final List<MoviePlace> searchResult;
  const CardMovie({Key? key, required this.searchResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        final MoviePlace place = searchResult[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    place: place,
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: place.title,
                    child: Image.network(
                      place.poster,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      place.title,
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(
                          place.rating,
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
