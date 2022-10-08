import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/widgets/screens/favorite_meals_screen.dart';
import 'package:flutter_playground_meals_app/widgets/screens/list_categories_screen.dart';

import '../../models/meal.dart';
import '../main_drawer.dart';

class TabBarScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  const TabBarScreen(this._favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedTabIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    _screens = [
      {
        'screen': const ListCategoriesScreen(),
        'title': 'Categories',
      },
      {
        'screen': FavoriteMealsScreen(widget._favoriteMeals),
        'title': 'Favorites',
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedTabIndex]['title'] as String),
      ),
      body: _screens[_selectedTabIndex]['screen'] as Widget,
      drawer: Container(
        color: Theme.of(context).colorScheme.primary,
        child: const SafeArea(
          child: MainDrawer(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void _selectTab(int tabIndex) {
    setState(() {
      _selectedTabIndex = tabIndex;
    });
  }
}
