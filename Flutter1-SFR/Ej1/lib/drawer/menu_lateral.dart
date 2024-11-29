import 'package:flutter/material.dart';

import '../screens/screens.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Samuel Fernández Rodríguez"),
            accountEmail: Text("sferrod0401@g.educaand.es"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ibai.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 1",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace1()));
              },
            ),
          ),
          Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 2",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace2()));
              },
            ),
          ),
          Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 3",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace3()));
              },
            ),
          ),
          Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 4",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace4()));
              },
            ),
          ),
          Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 5",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace5()));
              },
            ),
          ),
          Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 6",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace6()));
              },
            ),
          ),
          Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 7",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace7()));
              },
            ),
          ),
          Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 8",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace8()));
              },
            ),
          ),
          Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 9",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace9()));
              },
            ),
          ), Ink(
            color: const Color(0xFF6B7FD7),
            child: ListTile(
              title: const Text(
                "Ejercicio 10 (No Dual)",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace10()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
