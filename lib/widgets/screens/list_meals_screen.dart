import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/widgets/list_meal_item.dart';

import '../../models/dummy_data.dart';
import '../../models/meal.dart';

class ListMealsScreen extends StatelessWidget {
  static const routeName = '/list-meals';

  const ListMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    final List<Meal> mealsForCategory = allMeals.where((m) {
      return m.categoryIds.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return ListMealItem(mealsForCategory[i]);
        },
        itemCount: mealsForCategory.length,
      ),
    );
  }
}
