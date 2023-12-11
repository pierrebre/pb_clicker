import 'package:flutter/material.dart';
import 'package:pb_clicker/main.dart';

class RecipeWidget extends StatelessWidget {
  final Recipe recipe;

  RecipeWidget({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(recipe.name),
        subtitle: Text('${recipe.description}\nCoût: ${recipe.cost}'),
        trailing: ElevatedButton(
          onPressed: () {
            // Vérifie si les ressources sont suffisantes avant de produire
            if (canProduce(recipe)) {
              // Produire l'objet et ajouter à l'inventaire
              produceObject(recipe);
            } else {
              // Affiche un message ou ne fait rien si les ressources sont insuffisantes
            }
          },
          child: Text('Produire'),
        ),
      ),
    );
  }

  bool canProduce(Recipe recipe) {
    // Logique pour vérifier si les ressources sont suffisantes
    return true;
  }

  void produceObject(Recipe recipe) {
    // Logique pour produire l'objet et l'ajouter à l'inventaire
    //TODO: Ajouter l'objet à l'inventaire
  }
}
