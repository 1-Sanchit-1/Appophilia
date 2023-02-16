import 'package:appophilia/pages/Home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Flutter Flux",
    debugShowCheckedModeBanner: false,
    theme:  ThemeData(
      brightness: Brightness.light,
    ),
    // darkTheme: ThemeData.dark(),
    home: Home(),
  ));
}
