// recipes_page.dart

import 'package:flutter/material.dart';
import 'package:pb_clicker/main.dart';
import 'package:pb_clicker/recipe_widget.dart';

class RecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recettes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeWidget(recipe: recipes[index]);
        },
      ),
    );
  }
}
