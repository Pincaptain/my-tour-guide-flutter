import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import 'package:my_tour_guide/routes.dart';
import 'package:my_tour_guide/features/map/presentation/pages/map.dart';
import 'package:my_tour_guide/injection.dart';

void main() {
  setupInjection(Environment.development);
  setupRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Tour Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      navigatorKey: sailor.navigatorKey,
      onGenerateRoute: sailor.generator(),
      home: MapPage(),
    );
  }
}