import 'package:first_app/models/Meal.dart';
import 'package:flutter/material.dart';

class Meals_Details extends StatelessWidget {
  const Meals_Details({super.key, required this.meals});

  final Meal meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meals.title),),
     body: Column(
      children: [
         Text(meals.affordability.name),
         Text(meals.complexity.name),
         for (final items in meals.ingredients)
            Text(items),
         for (final items in meals.steps)
            Text(items)
     ]),
    );
  }
}
