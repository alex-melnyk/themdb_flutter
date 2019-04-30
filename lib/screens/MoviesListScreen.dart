import 'package:flutter/material.dart';
import 'package:my_app/bloc/ApplicationBloc.dart';
import 'package:my_app/bloc/BlocProvider.dart';
import 'package:my_app/models/Movie.dart';
import 'package:my_app/widgets/MovieCard.dart';

class MoviesListScreen extends StatefulWidget {
  final moviesCategory;

  MoviesListScreen(this.moviesCategory);

  @override
  _MoviesListScreenState createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  Widget _buildMoviesList(List<Movie> _moviesList) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _moviesList.length,
          itemBuilder: (context, index) {
            return MovieCard(_moviesList[index]);
          }),
    );
  }

  Future<void> _updateMoviesList() async {
    return BlocProvider.of<ApplicationBloc>(context).movieBloc.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: StreamBuilder(
          stream: BlocProvider.of<ApplicationBloc>(context).movieBloc.outMovies,
          builder: (ctx, AsyncSnapshot<List<Movie>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return _buildMoviesList(snapshot.data);
          },
        ),
        onRefresh: _updateMoviesList);
  }
}
