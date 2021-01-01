import 'package:flutter/material.dart';
import 'package:foodies/models/Meal.dart';
import '../widgets/Meal_Item.dart';

class CategoryMealView extends StatelessWidget {
  final List<Meal> availableMeals;
  CategoryMealView(this.availableMeals);
  static const String routename = "/CategoryMealView";
  // final String categoryId;

  // final String categoryTitle;

  // Category_Meal_View(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categorytitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageurl: categoryMeals[index].imageUrl,
          );
        },
      ),
    );
  }
}
