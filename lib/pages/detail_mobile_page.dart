import 'package:flutter/material.dart';
import 'package:movie_apps/components/favorite_button.dart';
import 'package:movie_apps/model/movie_place.dart';
import 'package:movie_apps/theme.dart';

class DetailMobilePage extends StatelessWidget {
  const DetailMobilePage({
    Key? key,
    required this.place,
  }) : super(key: key);

  final MoviePlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: place.title,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          place.poster,
                        ),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: whiteColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        color: pinkColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 250,
                    child: CircleAvatar(
                      backgroundColor: greyColor,
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow_rounded,
                          color: whiteColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.title,
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            place.duration,
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            ' | ',
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            place.genre,
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                FavoriteButton(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width - 20,
              child: Text(
                place.overview,
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pemeran',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: greyColor,
                    size: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.cast.map((c) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                c['image'],
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              c['name'],
                              style: whiteTextStyle.copyWith(
                                color: blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
