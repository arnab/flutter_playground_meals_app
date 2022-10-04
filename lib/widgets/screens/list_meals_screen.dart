import 'package:flutter/material.dart';

class ListMealsScreen extends StatelessWidget {
  static const routeName = '/list-meals';

  const ListMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(child: Text('Meals for $categoryTitle')),
    );
  }
}
