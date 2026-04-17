import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),

      // ✅ FIXED BODY (scrollable + no overflow)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Title
            Text(
              recipe.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Description
            Text(
              recipe.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // 🔹 Ingredients Heading
            const Text(
              "Ingredients:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Ingredients List (NO ListView, NO Expanded)
            Column(
              children: recipe.ingredients.map((ingredient) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.check),
                    title: Text(ingredient),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
