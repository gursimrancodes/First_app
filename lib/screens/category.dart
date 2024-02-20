import 'package:first_app/models/Category.dart';
import 'package:first_app/screens/meals_screen.dart';
import 'package:first_app/widgets/category_items.dart';
import 'package:flutter/material.dart';
import 'package:first_app/data/dummy_data.dart';

class CategoryScreens extends StatelessWidget {
  const CategoryScreens({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filters_meal = dummyMeals
        .where((meals) => meals.categories.contains(category.id)).toList();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => Meals_Screen(meals: filters_meal, title: category.title,))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final items in availableCategories)
            CategoryItems(
                category: items,
                selectCategory: () {
                  _selectCategory(context, items);
                })
        ],
      ),
    );
  }
}
