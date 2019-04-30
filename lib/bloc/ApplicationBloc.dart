import 'package:my_app/bloc/BlocProvider.dart';
import 'package:my_app/bloc/MoviesBloc.dart';

class ApplicationBloc extends BlocBase {
  static ApplicationBloc _singleton;

  factory ApplicationBloc() {
    return _singleton ??= ApplicationBloc._internal();
  }

  ApplicationBloc._internal() {
    movieBloc = MoviesBloc();
  }

  MoviesBloc movieBloc;

  @override
  void dispose() {}
}
