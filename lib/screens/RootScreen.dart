import 'package:flutter/material.dart';
import 'package:my_app/bloc/ApplicationBloc.dart';
import 'package:my_app/bloc/BlocProvider.dart';
import 'package:my_app/screens/MoviesListScreen.dart';
import 'package:my_app/utils.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  ApplicationBloc applicationBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    applicationBloc = BlocProvider.of<ApplicationBloc>(context)
      ..movieBloc.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                flexibleSpace: SafeArea(
              child: TabBar(tabs: [
                Tab(text: 'NOW PLAYING', icon: Icon(Icons.play_circle_outline)),
                Tab(text: 'POPULAR', icon: Icon(Icons.movie_filter)),
                Tab(text: 'TOP RATED', icon: Icon(Icons.star)),
              ]),
            )),
            body: TabBarView(children: [
              MoviesListScreen(MoviesCategories.MOVIES_NOW_PLAYING),
              MoviesListScreen(MoviesCategories.MOVIES_TOP_RATED),
              MoviesListScreen(MoviesCategories.MOVIES_POPULAR)
            ])));
  }
}
