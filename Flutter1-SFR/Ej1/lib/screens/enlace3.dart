import 'package:flutter/material.dart';
import '../drawer/menu_lateral.dart';

class Enlace3 extends StatelessWidget {
  const Enlace3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 3'),
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ibai.jpg", scale: 2.5),
            Image.asset("assets/images/ibai.jpg", scale: 2.5),
            Image.asset("assets/images/ibai.jpg", scale: 2.5),
          ],
        ),
      ),
    );
  }
}
