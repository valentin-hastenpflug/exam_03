import 'package:flutter/material.dart';
import '../screens/recipes_screen.dart';

class CategoryTile extends StatelessWidget {
  final Set<Map<String, dynamic>> recipes;
  final String categoryName;
  const CategoryTile(
      {super.key, required this.recipes, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final capitalizedCategoryName = categoryName.substring(0, 1).toUpperCase() +
        categoryName.substring(1); //first letter to uppercase
    void onTap() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RecipesScreen(categoryName: categoryName, recipes: recipes),
          ));
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.9),
                spreadRadius: 5,
                blurRadius: 12,
                offset: const Offset(0, 3))
          ],
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Text(capitalizedCategoryName,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
