import 'package:exam_03/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Map<String, dynamic> _data = {};
  Map<String, Set<Map<String, dynamic>>>? _categoryRecipes = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final data = await loadJsonFromAssets(
      'assets/data/mobile-apps-2024ss-portfolio-exam-03-recipes.json',
    );
    setState(() {
      _data = data;
      _categoryRecipes = _categorizeRecipes(_data);
    });
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Map<String, Set<Map<String, dynamic>>> _categorizeRecipes(
      Map<String, dynamic> data) {
    final Map<String, Set<Map<String, dynamic>>> categorizedRecipes = {};
    for (var recipe in data['recipes']) {
      final category = recipe['category'] as String;
      if (!categorizedRecipes.containsKey(category)) {
        categorizedRecipes[category] = {};
      }
      categorizedRecipes[category]!.add(recipe);
    }
    return categorizedRecipes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Categories"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 20),
        child: _categoryRecipes!.isEmpty
            ? Center(
                child: Text(
                "Loading...",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    fontSize: 20),
              ))
            : GridView.count(
                crossAxisCount: 2,
                children: _categoryRecipes!.keys.map((category) {
                  return CategoryTile(
                    recipes: _categoryRecipes![category]!,
                    categoryName: category,
                  );
                }).toList(),
              ),
      ),
    );
  }
}
