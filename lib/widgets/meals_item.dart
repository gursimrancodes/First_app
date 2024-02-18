import 'package:first_app/models/Meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Meals_Item extends StatelessWidget {
  Meals_Item({super.key, required this.meals, required this.onSelectMeal});

  final Meal meals;
  final void Function() onSelectMeal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectMeal();
      },
      child: Container(
        child: Column(children: [
          Text(
            meals.title,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.network(meals.imageUrl),
          ),
        ]),
      ),
    );
  }
}
