import 'package:flutter/material.dart';

class ListMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const ListMealsScreen({Key? key, required this.categoryId, required this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(child: Text('Meals for $categoryTitle')),
    );
  }
}
