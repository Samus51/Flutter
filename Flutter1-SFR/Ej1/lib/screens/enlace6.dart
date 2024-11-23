import 'package:flutter/material.dart';
import 'screens.dart';

class Enlace6 extends StatelessWidget {
  const Enlace6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 6"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIconColumn("assets/images/ibai.jpg", "Ibai"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildIconColumn("assets/images/pov.jpg", "Pov"),
                buildIconColumn("assets/images/kiko.jpg", "Kiko"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildIconColumn("assets/images/moros.jpg", "Matamoros"),
                buildIconColumn("assets/images/papa.jpg", "Pablo Motos"),
                buildIconColumn("assets/images/jorge.jpg", "Jorge Javier"),
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
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
