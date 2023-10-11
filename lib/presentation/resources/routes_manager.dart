
import 'package:cocktail/presentation/resources/string_manager.dart';
import 'package:cocktail/presentation/categories/categories_list_screen.dart';
import 'package:cocktail/presentation/drinks_details/drink_details_screen.dart';
import 'package:cocktail/presentation/drinkslist/drinks_list_screen.dart';
import 'package:flutter/material.dart';
import '../drinks_steps/drink_steps_screen.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String categoriesListRoute = '/categories';
  static const String drinksListScreenRoute = '/drinksListScreen';
  static const String drinkDetailsScreenRoute = '/drinkDetailsScreen';
  static const String drinkStepsScreenRoute = '/drinkStepsScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.categoriesListRoute:
        return MaterialPageRoute(builder: (_) => const CategoriesListPage());
      case Routes.drinksListScreenRoute:
        return MaterialPageRoute(builder: (_) =>  DrinksListScreen(title: routeSettings.arguments as String,));
      case Routes.drinkDetailsScreenRoute:
        return MaterialPageRoute(builder: (_) => DrinkDetailsScreen(drinkId: routeSettings.arguments as String));
      case Routes.drinkStepsScreenRoute:
        return MaterialPageRoute(builder: (_) => const DrinkStepsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}

