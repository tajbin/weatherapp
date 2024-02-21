import 'package:flutter/material.dart';
import 'package:weatherapp/Activity/loading.dart';

import 'Activity/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {
       "/" : (context) => Loading(),
       "/home" : (context) => Home(),
     },
     );
  }
}

