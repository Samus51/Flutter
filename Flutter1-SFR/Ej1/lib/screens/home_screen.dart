import 'package:flutter/material.dart';

import 'screens.dart'; // Importa tu MenuLateral

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla de Inicio")),
      drawer: const MenuLateral(),
      body: const Center(
          child: Text("Bienvenido al Drawer de Samuel Fernández Rodríguez")),
    );
  }
}
