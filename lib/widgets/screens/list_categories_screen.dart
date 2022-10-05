import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/widgets/category_item.dart';

import '../../models/dummy_data.dart';

class ListCategoriesScreen extends StatelessWidget {
  final String appTitle;

  const ListCategoriesScreen({super.key, required this.appTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$appTitle: Categories'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: allCategories
            .map((c) => CategoryItem(
                  id: c.id,
                  title: c.title,
                  color: c.color,
                ))
            .toList(),
      ),
    );
  }
}
