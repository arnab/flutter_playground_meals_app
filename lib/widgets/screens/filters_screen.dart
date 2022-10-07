import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                'Gluten Free',
                _glutenFree,
                (val) {
                  setState(
                    () {
                      _glutenFree = val;
                    },
                  );
                },
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(
      String title, bool val, ValueChanged<bool> switchHandler) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text('Only Include $title Items'),
      value: val,
      onChanged: switchHandler,
    );
  }
}
