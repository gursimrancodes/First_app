import 'package:first_app/models/Category.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems(
      {super.key, required this.category, required this.selectCategory});

  final Category category;
  final void Function() selectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory();
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
