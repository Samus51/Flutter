import 'package:flutter/material.dart';
import 'package:holamundo/drawer/menu_lateral.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menú Principal',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE0F7FA),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Menú Principal"),
        ),
        drawer: const MenuLateral(),
        body: const Center(
          child: Text("Drawer de Samuel Fernández Rodríguez"),
        ),
      ),
    );
  }
}
