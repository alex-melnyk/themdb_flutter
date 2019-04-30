import 'package:my_app/bloc/BlocProvider.dart';
import 'package:my_app/models/Movie.dart';
import 'package:my_app/utils.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc extends BlocBase {
  BehaviorSubject<List<Movie>> _moviesController =
      BehaviorSubject<List<Movie>>();

  Sink<List<Movie>> get inMovies => _moviesController.sink;

  Stream<List<Movie>> get outMovies => _moviesController.stream;

  Future<void> getMovies() async {
    inMovies.add(await fetchMovies(MoviesCategories.MOVIES_NOW_PLAYING));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _moviesController.close();
  }
}
