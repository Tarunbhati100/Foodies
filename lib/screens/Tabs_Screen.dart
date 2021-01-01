import 'package:flutter/material.dart';
import 'package:foodies/models/Meal.dart';
import 'package:foodies/screens/Categories_Screen.dart';
import 'package:foodies/screens/Favorites_Screen.dart';
import 'package:foodies/widgets/Main_Drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  TabsScreen(this.favouriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,dynamic>> _pages; 
  @override
  initState(){
    _pages = [
    {'Screen':Categories_Screen(),'title':'CATEGORIES'},
    {'Screen':FavoritesScreen(widget.favouriteMeal),'title':'FAVORITES'},
  ];
  }
  int _selectedPageIndex = 0;
  void _selectpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectpage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star), label: "Favorites"),
          ]),
    );
  }
}
