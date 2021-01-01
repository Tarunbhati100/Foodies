import 'package:flutter/material.dart';
import 'package:foodies/models/Meal.dart';
import 'package:foodies/widgets/Meal_Item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavoritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text(
          "You have no Favorites yet. Start Adding Some..",
        ),
      );
    }else {
      return ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
            imageurl: favouriteMeals[index].imageUrl,
          );
        },
      );
    }
}
}