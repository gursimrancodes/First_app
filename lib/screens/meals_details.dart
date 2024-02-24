import 'package:first_app/models/Meal.dart';
import 'package:flutter/material.dart';

class Meals_Details extends StatelessWidget {
  const Meals_Details({super.key, required this.meals});

  final Meal meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.network(meals.imageUrl)),
          Text("Affordable or not: " + meals.affordability.name),
          Text("Meal Complexity: " + meals.complexity.name),
          SizedBox(
            height: 30,
          ),
          Container(
              height: 160,
              width: 300,
              decoration: BoxDecoration(color: Colors.orange.shade800),
              child: Column(
                children: [
                  Text("Ingredients:"),
                  for (final items in meals.ingredients) Text(items),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text("Steps for preparation of :\n" + meals.title)),
          ),
          SizedBox(
            height: 15,
          ),
          for (final items in meals.steps)
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    items,
                    style: TextStyle(fontSize: 12),
                  ),
                )),
        ]),
      ),
    );
  }
}
