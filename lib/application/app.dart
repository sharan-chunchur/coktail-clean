
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/resources/routes_manager.dart';
import 'theme.dart';

class MyApp extends StatefulWidget {

  const MyApp._internal(); //private named constructor

  static const MyApp instance = MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance;  // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Cocktail',
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}