import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/Home.dart';
import 'package:worldtimeapp/pages/Loading.dart';
import 'package:worldtimeapp/pages/Locations.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context)=> Loading(),
      '/Home': (context)=> Home(),
      '/Locations': (context)=> Locations()
  },
  ));
}

