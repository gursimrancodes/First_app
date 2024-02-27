import 'package:first_app/models/Meal.dart';
import 'package:first_app/provider/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterMealNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterMealNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider =
    StateNotifierProvider<FilterMealNotifier, Map<Filter, bool>>((ref) {
  return FilterMealNotifier();
});

final filterMealProvider = Provider((ref) {
  final meal = ref.watch(mealsProvider);
  final filters = ref.watch(filterProvider);

  return meal.where((element) {
    if (filters[Filter.glutenFree]! && !element.isGlutenFree) {
      return false;
    }
    if (filters[Filter.lactoseFree]! && !element.isLactoseFree) {
      return false;
    }
    if (filters[Filter.vegan]! && !element.isVegan) {
      return false;
    }
    if (filters[Filter.vegetarian]! && !element.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
