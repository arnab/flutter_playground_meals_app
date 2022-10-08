import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/models/dummy_data.dart';
import 'package:flutter_playground_meals_app/widgets/screens/filters_screen.dart';
import 'package:flutter_playground_meals_app/widgets/screens/show_meal_screen.dart';
import 'package:flutter_playground_meals_app/widgets/screens/tab_bar_screen.dart';

import 'models/meal.dart';
import 'widgets/screens/list_categories_screen.dart';
import 'widgets/screens/list_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const appTitle = 'Mealzsy';
  static const primaryColor = Colors.pink;
  static const primaryColorAccent = Colors.pinkAccent;
  static const secondaryColor = Colors.amber;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TODO: Extract this as a named "Settings/Filters" object and not a Map
  Map<String, bool> _filters = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactoseFree': false,
  };

  List<Meal> _availableMeals = allMeals;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;
      _availableMeals = _availableMeals.where((meal) {
        if (_filters['glutenFree']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['lactoseFree']! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MyApp.primaryColor,
        ).copyWith(
          secondary: MyApp.secondaryColor,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
              ),
              titleMedium: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(MyApp.secondaryColor),
          trackColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? MyApp.primaryColorAccent
                  : null),
        ),
      ),
      routes: {
        '/': (ctx) => TabBarScreen(_favoriteMeals),
        ListMealsScreen.routeName: (ctx) => ListMealsScreen(_availableMeals),
        ShowMealScreen.routeName: (ctx) => ShowMealScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
      onUnknownRoute: (settings) {
        // TODO: Emit metric and errors here
        if (kDebugMode) {
          print(
              'Error routing to: ${settings.name} with args: ${settings.arguments}');
        }

        return MaterialPageRoute(
          builder: (context) {
            return const ListCategoriesScreen();
          },
        );
      },
    );
  }

  void _toggleFavorite(String mealId) {
    final i = _favoriteMeals.indexWhere((m) => m.id == mealId);
    if (i >= 0) {
      setState(() {
        _favoriteMeals.removeAt(i);
      });
    } else {
      setState(() {
        _favoriteMeals.add(allMeals.firstWhere((m) => m.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((m) => m.id == mealId);
  }
}
