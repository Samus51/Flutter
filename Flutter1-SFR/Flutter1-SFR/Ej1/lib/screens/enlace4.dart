import 'package:flutter/material.dart';
import 'screens.dart';

class Enlace4 extends StatelessWidget {
  const Enlace4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4'),
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
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.heart_broken,
              size: 50.0,
              color: Colors.cyan,
            ),
            Icon(
              Icons.heart_broken,
              size: 50.0,
              color: Colors.red,
            ),
            Icon(
              Icons.heart_broken,
              size: 50.0,
              color: Colors.yellow,
            ),
            Icon(
              Icons.heart_broken,
              size: 50.0,
              color: Colors.orange,
            ),
            Icon(
              Icons.heart_broken,
              size: 50.0,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
