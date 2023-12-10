// inventory_page.dart

import 'package:flutter/material.dart';
import 'package:pb_clicker/main.dart';

class InventoryPage extends StatelessWidget {
  List<InventoryItem> inventory = [
    InventoryItem(name: 'Item A', quantity: 10),
    InventoryItem(name: 'Item B', quantity: 5),
    InventoryItem(name: 'Item C', quantity: 8),
  ]; // Utilise maintenant le modèle InventoryItem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventaire'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: () {
              sortInventoryByName();
            },
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              sortInventoryByQuantity();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: inventory.length,
        itemBuilder: (context, index) {
          return InventoryItemWidget(item: inventory[index]);
        },
      ),
    );
  }

  void sortInventoryByName() {
    inventory.sort((a, b) => a.name.compareTo(b.name));
  }

  void sortInventoryByQuantity() {
    inventory.sort((a, b) => a.quantity.compareTo(b.quantity));
  }
}

class InventoryItemWidget extends StatelessWidget {
  final InventoryItem item;

  InventoryItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text('Quantité: ${item.quantity}'),
    );
  }
}
