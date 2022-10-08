import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../list_meal_item.dart';

class FavoriteMealsScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  const FavoriteMealsScreen(this._favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites, start adding some!'),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, i) {
        return ListMealItem(_favoriteMeals[i]);
      },
      itemCount: _favoriteMeals.length,
    );
  }
}
