import 'package:flutter/material.dart';
import 'package:flutter_playground_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> filters;

  const FiltersScreen(this.saveFilters, this.filters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;


  @override
  void initState() {
    _glutenFree = widget.filters['glutenFree']!;
    _vegetarian = widget.filters['vegetarian']!;
    _vegan = widget.filters['vegan']!;
    _lactoseFree = widget.filters['lactoseFree']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () => widget.saveFilters({
              'glutenFree': _glutenFree,
              'vegetarian': _vegetarian,
              'vegan': _vegan,
              'lactoseFree': _lactoseFree,
            }),
            icon: const Icon(Icons.save),
          ),
        ],
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
              _buildSwitchListTile(
                'Vegetarian',
                _vegetarian,
                (val) {
                  setState(
                    () {
                      _vegetarian = val;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                _vegan,
                (val) {
                  setState(
                    () {
                      _vegan = val;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Lactose Free',
                _lactoseFree,
                (val) {
                  setState(
                    () {
                      _lactoseFree = val;
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
