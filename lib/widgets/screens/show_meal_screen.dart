import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/models/meal.dart';

class ShowMealScreen extends StatelessWidget {
  final Function(String) _favoriteToggleHandler;
  final Function(String) _isMealFavorite;

  const ShowMealScreen(
      this._favoriteToggleHandler, this._isMealFavorite, {Key? key})
      : super(key: key);

  static const routeName = '/meals/show';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Meal>;
    final meal = routeArgs['meal']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildContainer(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[i]),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(
                child: ListView.builder(
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text('# ${i + 1}')),
                      title: Text(meal.steps[i]),
                    ),
                    const Divider(),
                  ],
                );
              },
              itemCount: meal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _favoriteToggleHandler(meal.id),
        child: Icon(_isMealFavorite(meal.id) ? Icons.star : Icons.star_border),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String sectionName) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        sectionName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _buildContainer({child = Widget}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }
}
