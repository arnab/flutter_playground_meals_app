import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/models/meal.dart';

class ShowMealScreen extends StatelessWidget {
  const ShowMealScreen({Key? key}) : super(key: key);

  static const routeName = '/meals/show';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, Meal>;
    final meal = routeArgs['meal']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body:  Center(
        child: Text(meal.title),
      ),
    );
  }
}
