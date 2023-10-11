import 'package:cocktail/presentation/resources/routes_manager.dart';
import 'package:cocktail/application/theme.dart';
import 'package:cocktail/presentation/categories/categories_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application/app.dart';
import 'application/dependency_injection.dart';

// import 'config/routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(ProviderScope(child: MyApp()));
}
