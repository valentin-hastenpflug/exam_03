import 'package:flutter/material.dart';

import '../screens/recipe_detail_screen.dart';

class RecipeTile extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeTile({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipe: recipe),
          ));
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.9),
              spreadRadius: 5,
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe["name"],
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Ingredients: ${recipe["ingredients"].join(', ')}',
              overflow: TextOverflow
                  .ellipsis, // Truncates text with ellipsis (...) if it doesn't fit.
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
