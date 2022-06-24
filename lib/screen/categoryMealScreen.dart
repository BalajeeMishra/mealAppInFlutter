// import 'package:flutter/material.dart';
// import '../dummy_data.dart';
// import '../widgets/meal_item.dart';

// //CategoryMealsScreen starting me stateless tha now i am changing

// class CategoryMealsScreen extends StatelessWidget {
//   static const routeName = "/category-meals";
//   // final String id;
//   // final String title;
//   // CategoryMealsScreen(this.id, this.title);

//   @override
//   Widget build(BuildContext context) {
//     final routeArgs =
//         ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     final categoryTitle = routeArgs["title"];
//     final categoryId = routeArgs["id"];
//     final categoryMeals = DUMMY_MEALS.where((meal) {
//       return meal.categories.contains(categoryId);
//     }).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle),
//       ),
//       body: ListView.builder(
//         itemBuilder: (ctx, index) {
//           return MealItem(
//             id: categoryMeals[index].id,
//             title: categoryMeals[index].title,
//             imageUrl: categoryMeals[index].imageUrl,
//             duration: categoryMeals[index].duration,
//             complexity: categoryMeals[index].complexity,
//             affordability: categoryMeals[index].affordability,
//           );
//         },
//         itemCount: categoryMeals.length,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

//CategoryMealsScreen starting me stateless tha now i am changing

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // if (!loadedInitData) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    displayedMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    // loadedInitData = true;
    // }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
            // removeItem: removeMeal,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
