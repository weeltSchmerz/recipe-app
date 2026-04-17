import 'package:flutter/material.dart';
import 'models/recipe.dart';
import 'data/recipe_data.dart';
import 'screens/recipe_detail_screen.dart';


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
      body: ListView.separated(
        itemCount: recipes.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final recipe = recipes[index];

          return ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

