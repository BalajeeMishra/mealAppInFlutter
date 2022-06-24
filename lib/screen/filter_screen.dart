import 'package:flutter/material.dart';
import '../widgets/maindrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;
  FilterScreen(this.currentFilter, this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

// 1)?
// 2)!
// 3)?.

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  initState() {
    glutenFree = widget.currentFilter["_gluten"]!;
    vegetarian = widget.currentFilter["_vegatarian"] ?? false;
    vegan = widget.currentFilter["_vegan"] ?? false;
    lactoseFree = widget.currentFilter["lactose"] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) UpdateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: UpdateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _selectedFilters = {
                  "gluten": glutenFree,
                  "lactose": lactoseFree,
                  "vegan": vegan,
                  "vegetarian": vegetarian,
                };

                widget.saveFilters(_selectedFilters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "Adjust Your meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    "Gluten-free", "only include gluten free meals", glutenFree,
                    (newValue) {
                  setState(() {
                    glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile("lactose-Free",
                    "only include lactose free meals", lactoseFree, (newValue) {
                  setState(() {
                    lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "vegetarian",
                    "only include vegetarian free meals",
                    vegetarian, (newValue) {
                  setState(() {
                    vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "_vegan", "only include vegan free meals", vegan,
                    (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
