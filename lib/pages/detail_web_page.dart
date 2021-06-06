import 'package:flutter/material.dart';
import 'package:movie_apps/components/favorite_button.dart';
import 'package:movie_apps/model/movie_place.dart';
import 'package:movie_apps/theme.dart';

class DetailWebPage extends StatefulWidget {
  const DetailWebPage({
    Key? key,
    required this.place,
  }) : super(key: key);

  final MoviePlace place;

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: Center(
            child: Container(
              width: 800,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: widget.place.title,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                widget.place.poster,
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
                          height: 350,
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
                              widget.place.title,
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.place.duration,
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
                                  widget.place.genre,
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
                      widget.place.overview,
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
                    child: Scrollbar(
                      isAlwaysShown: true,
                      controller: _scrollController,
                      child: Container(
                        height: 150,
                        child: ListView(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          children: widget.place.cast.map((c) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
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
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
