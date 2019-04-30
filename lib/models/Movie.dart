class Movie {
  final int id;
  final String title;
  final String original_title;
  final String poster_path;
  final String release_date;

  Movie.fromMap(Map<String, Object> json)
      : id = json['id'],
        title = json['title'],
        original_title = json['original_title'],
        poster_path = json['poster_path'],
        release_date = json['release_date'];
}
