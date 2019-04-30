import 'package:flutter/material.dart';
import 'package:my_app/models/Movie.dart';
import 'package:my_app/models/MovieDetails.dart';
import 'package:my_app/utils.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailsScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetails>(
      future: fetchMovie(movie.id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(title: Text(movie.title)),
              body: Column(
                children: <Widget>[
                  LinearProgressIndicator(),
                  Image.network('$IMAGES_BASE_URL/${movie.poster_path}')
                ],
              ));
        }

        final movieDetails = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            title: Text(movieDetails.original_title),
          ),
          body: ListView(
            children: <Widget>[
              Image.network('$IMAGES_BASE_URL/${movieDetails.poster_path}'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Wrap(
                          alignment: WrapAlignment.center,
                          children: movieDetails.genres
                              .map((genre) => Padding(
                                  padding: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: Chip(
                                    label: Text(genre.name),
                                  )))
                              .toList()),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Overview',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      movieDetails.overview,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {}, child: Icon(Icons.thumb_up)),
        );
      },
    );
  }
}
