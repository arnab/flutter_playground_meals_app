import 'package:flutter/material.dart';

class ListMealsScreen extends StatelessWidget {
  const ListMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: const Center(child: Text('Meals for the category')),
    );
  }
}
