import 'package:flutter/material.dart';
import 'bmicalc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          //scaffoldBackgroundColor: Colors.black12,
          appBarTheme: const AppBarTheme(color: Colors.black38),
        ),
        home: const Bmicalc());
  }
}
