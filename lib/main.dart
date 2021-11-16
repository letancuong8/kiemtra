import 'package:flutter/material.dart';

// import 'Pages/Carousel_Page.dart';
import 'Pages/Home_Page.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/MainPage',
      routes: {
        '/MainPage': (context) => MyApp(),
        // '/Sliderr': (context) => Sliderr(),
      },
    ));
