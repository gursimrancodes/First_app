import 'package:first_app/screens/meals_screen.dart';
import 'package:first_app/widgets/category_items.dart';
import 'package:flutter/material.dart';
import 'package:first_app/data/dummy_data.dart';

class CategoryScreens extends StatelessWidget {
  const CategoryScreens({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(
          builder: ((context) =>  const Meals_Screen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your categories'),
      ),
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
            CategoryItems(category: items, 
            selectCategory: () {
              _selectCategory(context);
            })
        ],
      ),
    );
  }
}
