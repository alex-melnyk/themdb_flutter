import 'package:flutter/material.dart';
import 'package:my_app/bloc/ApplicationBloc.dart';
import 'package:my_app/bloc/BlocProvider.dart';
import 'package:my_app/screens/RootScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  @override
//  void initState() {
//    super.initState();
//
//  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: MaterialApp(home: RootScreen()),
    );
  }
}
