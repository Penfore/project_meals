import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';

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
      home: const CategoriesScreen(),
    );
  }
}
