import 'package:flutter/material.dart';

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
    // Convertir la couleur hexadécimale en une couleur utilisable dans Flutter
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
