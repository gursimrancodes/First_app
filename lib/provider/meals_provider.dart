import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:first_app/data/meal_data.dart';
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
