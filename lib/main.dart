import 'package:flutter/material.dart';
import 'package:project_meals/screens/meal_detail_screen.dart';
import 'package:project_meals/screens/settings_screen.dart';
import 'package:project_meals/screens/tabs_screen.dart';

import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.amber,
            ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
              bodyText1: const TextStyle(
                fontFamily: 'Raleway',
              ),
            ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      // home: CategoriesScreen(),
      routes: {
        AppRoutes.HOME: (context) => const TabScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (context) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (context) => const SettingsScreen(),
      },
    );
  }
}
