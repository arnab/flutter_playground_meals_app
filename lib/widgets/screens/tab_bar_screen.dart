import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/main.dart';
import 'package:flutter_playground_meals_app/widgets/screens/favorite_meals_screen.dart';
import 'package:flutter_playground_meals_app/widgets/screens/list_categories_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {

  int _selectedTabIndex = 0;
  final List<Widget> _screens = const [
    ListCategoriesScreen(),
    FavoriteMealsScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(MyApp.appTitle)),
      body: _screens[_selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedTabIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            backgroundColor: Theme.of(context).colorScheme.primary,
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
