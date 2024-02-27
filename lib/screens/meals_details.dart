import 'package:first_app/models/Meal.dart';
import 'package:first_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Meals_Details extends ConsumerWidget {
  const Meals_Details({super.key, required this.meals});

  final Meal meals;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(favoriteMealNotifier.notifier).toggleFiltermeal(meals);
              },
              icon: Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Image.network(
            meals.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Text("Affordable or not: " + meals.affordability.name),
          Text("Meal Complexity: " + meals.complexity.name),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                padding: EdgeInsets.all(20),
                // height: 160,
                // width: 300,
                decoration: BoxDecoration(color: Colors.orange.shade800),
                child: Column(
                  children: [
                    Text("Ingredients:"),
                    for (final items in meals.ingredients)
                      Text(
                        items,
                        style: TextStyle(fontSize: 20),
                      ),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Steps for preparation of :\n" + meals.title,
                  style: TextStyle(fontSize: 20),
                )),
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
                    style: TextStyle(fontSize: 20),
                  ),
                )),
        ]),
      ),
    );
  }
}
