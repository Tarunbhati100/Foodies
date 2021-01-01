import 'package:flutter/material.dart';
import 'package:foodies/widgets/Main_Drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routename = "/Filters-Screen";
  final Function saveFilters;
  final Map<String, bool> _currentFilter;
  FiltersScreen(this._currentFilter, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    _glutenfree = widget._currentFilter['glutenfree'];
    _lactosefree = widget._currentFilter['lactosefree'];
    _vegan = widget._currentFilter['vegan'];
    _vegetarian = widget._currentFilter['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentvalue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: currentvalue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Filters")),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection ",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      'Gluten Free',
                      "Only include Gluten Free meals",
                      _glutenfree, (newvalue) {
                    setState(() {
                      _glutenfree = newvalue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose Free',
                      "Only include Lactose Free meals",
                      _lactosefree, (newvalue) {
                    setState(() {
                      _lactosefree = newvalue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan', "Only include Vegan meals", _vegan, (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian',
                      "Only include Vegetarian meals", _vegetarian, (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  }),
                  Container(
                    
                    child: RaisedButton(
                      color: Colors.amber,
                      child:
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.sync,
                              color: Colors.red,
                              size: 50,
                            ),
                            Text("Apply Filter",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ), onPressed: () {
                      final selectedFilters = {
                        'glutenfree': _glutenfree,
                        'lactosefree': _lactosefree,
                        'vegan': _vegan,
                        'vegetarian': _vegetarian,
                      };
                      widget.saveFilters(selectedFilters);
                    }),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
