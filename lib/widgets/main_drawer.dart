import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.setScreen});

  final void Function(String identifier) setScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Center(child: Text("All Screens"))),
          ListTile(
            leading: Icon(Icons.restaurant),
            onTap: () {
              setScreen("Meals");
            },
            iconColor: Theme.of(context).colorScheme.onBackground,
            title: Text("Categories", style: Theme.of(context).textTheme.titleSmall),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            onTap: () {
              setScreen("Filters");
            },
            iconColor: Theme.of(context).colorScheme.onBackground,
            title:
                Text("Filters", style: Theme.of(context).textTheme.titleSmall),
          ),
        ],
      ),
    );
  }
}
