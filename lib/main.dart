import "package:flutter/material.dart";
import './dummy_data.dart';
import './models/Meal.dart';
import './screens/Filters_Screen.dart';
import './screens/Meal_Detail_Screen.dart';
import './screens/Tabs_Screen.dart';
import './screens/Category_Meals_View.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenfree': false,
    'lactosefree': false,
    'vegan': false,
    'vegetarian': false,
};

List<Meal> _availableMeals = DUMMY_MEALS;

List<Meal> _favouritedMeals = [];
void _setFilters(Map<String , bool> filterData){
setState(() {
  _filters = filterData;
  _availableMeals = DUMMY_MEALS.where((meal){
    if(_filters['glutenfree'] && !meal.isGlutenFree){
      return false;
    }if(_filters['lactosefree'] && !meal.isLactoseFree){
      return false;
    }if(_filters['vegan'] && !meal.isVegan){
      return false;
    }if(_filters['vegetarian'] && !meal.isVegetarian){
      return false;
    }
    return true;
  }).toList();
});
}
void _toggleFavourite(String mealId){
    final int existingIndex = _favouritedMeals.indexWhere((meal){
    return meal.id==mealId;});

    if(existingIndex >=0){
      setState(() {
        _favouritedMeals.removeAt(existingIndex);
      });
     } else{
       setState(() {
         _favouritedMeals.add(DUMMY_MEALS.firstWhere((meal){
           return meal.id==mealId;
         }));
       });
      }
}
bool _isMealFavourite(String id){
  return _favouritedMeals.any((meal)=>meal.id==id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Foodies",
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.cyan,
          fontFamily: 'PatrickHand',
        ),
        routes: {
          '/': (ctx) => TabsScreen(_favouritedMeals),
          CategoryMealView.routename: (ctx) => CategoryMealView(_availableMeals),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavourite,_isMealFavourite),
          FiltersScreen.routename: (ctx) => FiltersScreen(_filters,_setFilters),
        });
  }
}
