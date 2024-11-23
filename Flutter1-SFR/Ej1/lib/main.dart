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
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE0F7FA),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.grey, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
          displayLarge: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Menú Principal"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        drawer: const MenuLateral(),
        body: const Center(
          child: Text("Drawer de Samuel Fernández Rodríguez",
              style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
