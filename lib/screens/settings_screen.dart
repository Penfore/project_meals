import 'package:flutter/material.dart';
import 'package:project_meals/components/main_drawer.dart';
import 'package:project_meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String? title,
    String? subtitle,
    bool? value,
    void Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
        activeColor: Theme.of(context).colorScheme.primary,
        title: Text(title!),
        subtitle: Text(subtitle!),
        value: value!,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings!);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutén',
                  'Apenas exibe refeições sem glutén',
                  settings!.isGlutenFree,
                  (value) => setState(() => settings!.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Apenas exibe refeições sem lacotes',
                  settings!.isLactoseFree,
                  (value) => setState(() => settings!.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Apenas exibe refeições veganas',
                  settings!.isVegan,
                  (value) => setState(() => settings!.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Apenas exibe refeições vegetarianas',
                  settings!.isVegetarian,
                  (value) => setState(() => settings!.isVegetarian = value),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
