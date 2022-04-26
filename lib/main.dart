import 'package:flutter/material.dart';
import 'package:project_meals/data/dummy_data.dart';
import 'package:project_meals/models/meal.dart';
import 'package:project_meals/models/settings.dart';
import 'package:project_meals/screens/meal_detail_screen.dart';
import 'package:project_meals/screens/settings_screen.dart';
import 'package:project_meals/screens/tabs_screen.dart';

import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaibleMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _avaibleMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree! && !meal.isGlutenFree!;
        final filterLactose = settings.isLactoseFree! && !meal.isLactoseFree!;
        final filterVegan = settings.isVegan! && !meal.isVegan!;
        final filterVegetarian = settings.isVegetarian! && !meal.isVegetarian!;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
                color: Colors.black,
              ),
              bodyText1: const TextStyle(
                fontFamily: 'Raleway',
                color: Colors.black,
              ),
            ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      // home: CategoriesScreen(),
      routes: {
        AppRoutes.HOME: (context) => TabScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_avaibleMeals),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (context) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}
