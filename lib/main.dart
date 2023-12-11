// pb_clicker.dart

import 'package:flutter/material.dart';
import 'package:pb_clicker/recipes_page.dart';
import 'inventory_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> resources = [
    {'name': 'Bois', 'color': '#FF967969'},
    {'name': 'Minerai de fer', 'color': '#FFced4da'},
    {'name': 'Minerai de cuivre', 'color': '#FFd9480f'},
  ];

  int ironIngotsProduced = 1001;
  int copperIngotsProduced = 1001;

  @override
  Widget build(BuildContext context) {
    if (ironIngotsProduced >= 1000 && copperIngotsProduced >= 1000) {
      resources.add({'name': 'Charbon', 'color': '#FF000000'});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ressources'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InventoryPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.inventory),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RecipesPage()), // Assure-toi d'avoir le bon nom de la classe de la page Recettes
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return ResourceWidget(
            resourceName: resources[index]['name']!,
            resourceColor: resources[index]['color']!,
          );
        },
      ),
    );
  }
}

class ResourceWidget extends StatefulWidget {
  final String resourceName;
  final String resourceColor;

  ResourceWidget({required this.resourceName, required this.resourceColor});

  @override
  _ResourceWidgetState createState() => _ResourceWidgetState();
}

class _ResourceWidgetState extends State<ResourceWidget> {
  int resourceQuantity = 0;

  @override
  Widget build(BuildContext context) {
    Color color = Color(
        int.parse(widget.resourceColor.substring(1, 7), radix: 16) +
            0xFF000000);

    return GestureDetector(
      onTap: () {
        setState(() {
          resourceQuantity++;
        });
      },
      child: Card(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.resourceName,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Quantité: $resourceQuantity',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  resourceQuantity++;
                });
              },
              child: Text('Miner'),
            ),
          ],
        ),
      ),
    );
  }
}

class Recipe {
  final String name;
  final String description;
  final int cost;

  Recipe({required this.name, required this.description, required this.cost});
}

List<Recipe> recipes = [
  Recipe(name: 'Hache', description: 'Récolter le bois 3 par 3', cost: 2),
  // Ajoute d'autres recettes ici
];

class InventoryItem {
  final String name;
  final int quantity;

  InventoryItem({required this.name, required this.quantity});
}
