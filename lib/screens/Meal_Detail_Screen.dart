import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-details";
  final Function toggleFavourite;
  final Function isFavourite;
  MealDetailScreen(
    this.toggleFavourite,
    this.isFavourite,
  );
  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final modalArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = modalArgs["id"];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => (meal.id == mealId));
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedMeal.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, "INDREDIENTS"),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 200,
                width: 500,
                child: ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            selectedMeal.ingredients[index],
                          ),
                        ),
                      );
                    }),
              ),
              buildSectionTitle(context, "STEPS"),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 200,
                width: 500,
                child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              "#${index + 1}",
                            ),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(
                          thickness: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            isFavourite(mealId) ? Icons.star : Icons.star_border,
          ),
          onPressed: () {
            toggleFavourite(mealId);
          },
        ));
  }
}
