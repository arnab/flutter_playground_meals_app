import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/widgets/screens/filters_screen.dart';
import 'package:flutter_playground_meals_app/widgets/screens/show_meal_screen.dart';
import 'package:flutter_playground_meals_app/widgets/screens/tab_bar_screen.dart';

import 'widgets/screens/list_categories_screen.dart';
import 'widgets/screens/list_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Mealzsy';
  static const primaryColor = Colors.pink;
  static const primaryColorAccent = Colors.pinkAccent;
  static const secondaryColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primaryColor,
        ).copyWith(
          secondary: secondaryColor,
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
          thumbColor: MaterialStateProperty.all(secondaryColor),
          trackColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.selected) ? primaryColorAccent : null),
        ),
      ),
      routes: {
        '/': (ctx) => const TabBarScreen(),
        ListMealsScreen.routeName: (ctx) => const ListMealsScreen(),
        ShowMealScreen.routeName: (ctx) => const ShowMealScreen(),
        FiltersScreen.routeName: (ctx) => const FiltersScreen(),
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
}
