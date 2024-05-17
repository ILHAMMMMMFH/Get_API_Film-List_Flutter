import 'package:flutter/material.dart';
import './pages/home_pages.dart';
import './pages/item_page.dart';
import './pages/movie_list.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/item': (context) => ItemPage(),
      '/movielist': (context) => MovieList(),
    },
  ));
}
