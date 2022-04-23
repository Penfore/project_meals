import 'package:flutter/material.dart';
import 'package:project_meals/screens/categories_screen.dart';
import 'package:project_meals/screens/favorite_screen.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Vamos cozinhar?'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category_rounded),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star_rate_rounded),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            const FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
