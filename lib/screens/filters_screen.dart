import 'package:flutter/material.dart';

class Filters_Screen extends StatefulWidget {
  const Filters_Screen({super.key});

  @override
  State<Filters_Screen> createState() => _Filters_ScreenState();
}

class _Filters_ScreenState extends State<Filters_Screen> {
  bool _glutenfree = false;
  bool _isVegan = false;
  bool _isLactoseFree = false; 
  bool _isVegetarian = false; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: Column(
        children: [
          SwitchListTile(
              value: _glutenfree,
              title: Text("Gluten Free"),
              activeColor: Colors.lightGreen,
              onChanged: (bool value) {
               setState(() {
                  _glutenfree = value;
               });
              }),
          SwitchListTile(
              value: _isVegan,
              activeColor: Colors.lightGreen,
              title: Text("Vegan"),
              onChanged: (bool value) {
                setState(() {
                  _isVegan = value;
                });
              }),
          SwitchListTile(
              value: _isLactoseFree,
              activeColor: Colors.lightGreen,
              title: Text("Lactose Free"),
              onChanged: (bool value) {
                setState(() {
                  _isLactoseFree = value;
                });
              }),
          SwitchListTile(
              value: _isVegetarian,
              activeColor: Colors.lightGreen,
              title: Text("Vegetarian"),
              onChanged: (bool value) {
                setState(() {
                  _isVegetarian = value;
                });
              })
        ],
      ),
    );
  }
}
