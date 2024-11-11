import 'package:flutter/material.dart';
import 'screens.dart';

class Enlace2 extends StatelessWidget {
  const Enlace2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ejercicio 2'),
        ),
        drawer: const MenuLateral(),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/ibai.jpg",
            scale: 2.5,
          ),
          Image.asset("assets/images/ibai.jpg", scale: 2.5),
          Image.asset("assets/images/ibai.jpg", scale: 2.5),
        ])));
  }
}
