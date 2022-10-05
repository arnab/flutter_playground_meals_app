import 'package:flutter/material.dart';

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
          return Center(child: Text (mealsForCategory[i].title),);
        },
        itemCount: mealsForCategory.length,
      ),
    );
  }
}
