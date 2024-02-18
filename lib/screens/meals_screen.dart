import 'package:first_app/screens/meals_details.dart';
import 'package:first_app/widgets/meals_item.dart';
import 'package:flutter/material.dart';
import 'package:first_app/models/Meal.dart';

class Meals_Screen extends StatelessWidget {
  const Meals_Screen({super.key, required this.meals, required this.title});

  final List<Meal> meals;
  final String title;

  void onSelectMeal(BuildContext context, Meal meals) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Meals_Details(meals: meals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return Meals_Item(
              meals: meals[index],
              onSelectMeal: () {
                onSelectMeal(context, meals[index]);
              },
            );
          },
        ));
  }
}
