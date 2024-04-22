import 'package:flutter/material.dart';
import 'package:exam_03/widgets/recipe_tile.dart';

class RecipesScreen extends StatelessWidget {
  final String categoryName;
  final Set<Map<String, dynamic>> recipes;

  const RecipesScreen(
      {super.key, required this.categoryName, required this.recipes});

  @override
  Widget build(BuildContext context) {
    final String title =
        "${categoryName.substring(0, 1).toUpperCase()}${categoryName.substring(1)} Recipes";
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        children: recipes.map((element) {
          return RecipeTile(recipe: element);
        }).toList(),
      ),
    );
  }
}
