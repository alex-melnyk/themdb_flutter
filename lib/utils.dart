import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/Movie.dart';
import 'package:my_app/models/MovieDetails.dart';

const API_KEY = '3678e250ddb15c93ca4af8be76d6b0f6';
const API_BASE_URL = 'https://api.themoviedb.org/3';
const IMAGES_BASE_URL = 'https://image.tmdb.org/t/p/w500/';

Future<List<Movie>> fetchMovies(String category) async {
  final resp = await http.get('$API_BASE_URL/movie/$category?api_key=$API_KEY');
  return List.from(json.decode(resp.body)['results']).map((d) => Movie.fromMap(d)).toList();
}

Future<MovieDetails> fetchMovie(int movieId) async {
  final resp = await http.get('$API_BASE_URL/movie/$movieId?api_key=$API_KEY');
  return MovieDetails.fromMap(json.decode(resp.body));
}

class MoviesCategories {
  static const String MOVIES_NOW_PLAYING = 'now_playing';
  static const String MOVIES_POPULAR = 'popular';
  static const String MOVIES_TOP_RATED = 'top_rated';
}