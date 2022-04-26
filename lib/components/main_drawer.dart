import 'package:flutter/material.dart';
import 'package:project_meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItem({IconData? icon, String? label, void Function()? onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label!,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            icon: Icons.restaurant_rounded,
            label: 'Refeições',
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _createItem(
            icon: Icons.settings,
            label: 'Configurações',
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
