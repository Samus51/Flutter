import 'package:flutter/material.dart';

class Enlace6 extends StatelessWidget {
  const Enlace6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 6"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIconColumn("assets/images/ibai.jpg", "Icono 1"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildIconColumn("assets/images/ibai.jpg", "Icono 2"),
                buildIconColumn("assets/images/ibai.jpg", "Icono 3"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildIconColumn("assets/images/ibai.jpg", "Icono 4"),
                buildIconColumn("assets/images/ibai.jpg", "Icono 5"),
                buildIconColumn("assets/images/ibai.jpg", "Icono 6"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Función para construir la columna de icono y texto
  Column buildIconColumn(String imagePath, String label) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 60,
          height: 60,
        ),
        const SizedBox(height: 8), 
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
