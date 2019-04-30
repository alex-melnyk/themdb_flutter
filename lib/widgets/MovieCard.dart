import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/models/Movie.dart';
import 'package:my_app/screens/MovieDetailsScreen.dart';
import 'package:my_app/utils.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => MovieDetailsScreen(movie)));
      },
      child: Card(
        margin: EdgeInsets.all(10),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: <Widget>[
            ListTile(title: Text(movie.original_title)),
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('$IMAGES_BASE_URL${movie.poster_path}'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
