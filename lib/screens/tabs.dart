import 'package:first_app/provider/filter_provider.dart';
import 'package:first_app/provider/meals_provider.dart';
import 'package:first_app/screens/category.dart';
import 'package:first_app/screens/meals_screen.dart';
import 'package:first_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/filters_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tabs_Screen extends ConsumerStatefulWidget {
  const Tabs_Screen({super.key});

  @override
  ConsumerState<Tabs_Screen> createState() => _Tabs_ScreenState();
}

class _Tabs_ScreenState extends ConsumerState<Tabs_Screen> {
  int activeIndex = 0;
  void _selectPage(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "Filters") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Filters_Screen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeal = ref.watch(mealsProvider);
    Widget activePage = CategoryScreens(meals: availablemeal);
    var activePageTitle = "Category Screen";
    if (activeIndex == 1) {
      final filtermeal = ref.watch(filterMealsProvider);
      activePageTitle = "Favourites Screen";
      activePage = Meals_Screen(meals: filtermeal,title: activePageTitle,);
      
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        setScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: activeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
