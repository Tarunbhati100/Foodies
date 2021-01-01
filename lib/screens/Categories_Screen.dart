import 'package:flutter/material.dart';
import 'package:foodies/dummy_data.dart';
import '../widgets/Category_item.dart';

class Categories_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(5),
        children: Dummy_Categories.map(
          (data) => CategoryItem(data.id,
            data.title,
            data.color,
          ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),);
  }
}
