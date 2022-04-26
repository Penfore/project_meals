import 'package:flutter/material.dart';
import 'package:project_meals/components/main_drawer.dart';
import 'package:project_meals/models/meal.dart';
import 'package:project_meals/screens/categories_screen.dart';
import 'package:project_meals/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;
  List<String>? _titles;
  List<Widget>? _screens;

  @override
  void initState() {
    super.initState();
    _titles = [
      'Lista de Categorias',
      'Meus favoritos',
    ];
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_titles![_selectedScreenIndex]),
      ),
      drawer: const MainDrawer(),
      body: _screens![_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.category_rounded),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.star_rate_rounded),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
