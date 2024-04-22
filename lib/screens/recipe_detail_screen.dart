import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final String title =
        "${recipe['category'].substring(0, 1).toUpperCase()}${recipe['category'].substring(1)}: ${recipe['name']}";
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width - 20,
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
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe["name"],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Ingredients:",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
              ...recipe["ingredients"].map<Widget>((ingredient) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    '- $ingredient',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                    ),
                  ),
                );
              }).toList(),
            ],
          )),
    );
  }
}
