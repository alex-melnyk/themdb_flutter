class MovieGenre {
  final int id;
  final String name;

  MovieGenre.fromMap(Map<String, Object> json)
      : id = json['id'],
        name = json['name'];
}

class MovieDetails {
  final int id;
  final String original_title;
  final String overview;
  final String poster_path;
  final bool adult;
  final int budget;
  final List<MovieGenre> genres;

  MovieDetails.fromMap(Map<String, Object> json)
      : id = json['id'],
        original_title = json['original_title'],
        overview = json['overview'],
        poster_path = json['poster_path'],
        adult = json['adult'],
        budget = json['budget'],
        genres = (json['genres'] as List).map((v) => MovieGenre.fromMap(v)).toList();
}
