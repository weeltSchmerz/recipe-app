import 'package:flutter/material.dart';
import 'models/recipe.dart';
import 'data/recipe_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Recipe> recipes = parseRecipes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(recipe.title),
              subtitle: Text(recipe.description),
              leading: const Icon(Icons.restaurant_menu),
            ),
          );
        },
      ),
    );
  }
}
