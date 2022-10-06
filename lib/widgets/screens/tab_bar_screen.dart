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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.appTitle),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categories'),
              Tab(icon: Icon(Icons.star), text: 'Favorites'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ListCategoriesScreen(),
            FavoriteMealsScreen()
          ],
        ),
      ),
    );
  }
}
