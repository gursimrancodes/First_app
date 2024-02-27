import 'package:first_app/provider/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filters_Screen extends ConsumerWidget {
  const Filters_Screen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
              value: activeFilter[Filter.glutenFree]!,
              title: Text("Gluten Free"),
              activeColor: Colors.lightGreen,
              onChanged: (bool value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.glutenFree, value);
              }),
          SwitchListTile(
              value: activeFilter[Filter.vegan]!,
              activeColor: Colors.lightGreen,
              title: Text("Vegan"),
              onChanged: (bool value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegan, value);
              }),
          SwitchListTile(
              value: activeFilter[Filter.lactoseFree]!,
              activeColor: Colors.lightGreen,
              title: Text("Lactose Free"),
              onChanged: (bool value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.lactoseFree, value);
              }),
          SwitchListTile(
              value: activeFilter[Filter.vegetarian]!,
              activeColor: Colors.lightGreen,
              title: Text("Vegetarian"),
              onChanged: (bool value) {
                 ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegetarian, value);
              }),
        ],
      ),
    );
  }
}
