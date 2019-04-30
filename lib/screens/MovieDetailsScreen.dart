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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 5.0,
                          children: movieDetails.genres
                              .map((genre) => Chip(
                                    label: Text(genre.name),
                                    backgroundColor: Colors.blue,
                                    labelStyle: TextStyle(color: Colors.white),
                                  ))
                              .toList()),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Overview',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                          textAlign: TextAlign.right,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.blue,
                              ),
                              Text(
                                '${movieDetails.vote_average}',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
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
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.thumb_up)),
        );
      },
    );
  }
}
