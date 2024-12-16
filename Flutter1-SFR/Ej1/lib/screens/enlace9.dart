import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart'; // Importa SharedPreferences

import 'screens.dart';

class Enlace9 extends StatefulWidget {
  const Enlace9({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Enlace9 createState() => _Enlace9();
}

class _Enlace9 extends State<Enlace9> {
  int points = 0;
  late Image randomImage;
  final List<String> imagesPaths = [
    "assets/images/ibai.jpg",
    "assets/images/illojuan.jpg",
    "assets/images/orslok.jpg",
    "assets/images/polispol.jpg",
    "assets/images/vegetta777.jpg",
    "assets/images/papa.jpg",
  ];

  late Timer _timer;
  final Duration timeLimit = const Duration(seconds: 2);
  bool imageTouched = false;
  bool imageLocked = false;
  double xPosition = 0;
  double yPosition = 0;
  double maxWidth = 0;
  double maxHeight = 0;

  @override
  void initState() {
    super.initState();
    _loadPoints(); // Cargar puntos desde SharedPreferences
    getRandomImage();
    startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    maxWidth = MediaQuery.of(context).size.width - 120;
    maxHeight = MediaQuery.of(context).size.height - 250;
  }

  // Cargar puntos desde SharedPreferences
  void _loadPoints() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      points = prefs.getInt('points') ?? 0; // Si no hay valor guardado, 0 por defecto
    });
  }

  // Guardar puntos en SharedPreferences
  void _savePoints() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('points', points); // Guarda los puntos
  }

  void startTimer() {
    _timer = Timer.periodic(timeLimit, (timer) {
      setState(() {
        if (!imageTouched) {
          int prevPoints = points;
          points -= 2;

          if (prevPoints >= 0 && points < 0) {
            showSnackBar('¡Cuidado! Tienes puntos negativos :(');
          }
        }
        imageLocked = false;
        getRandomImage();
        _savePoints(); // Guardar puntos cada vez que cambia
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Ejercicio 9'),
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: theme.primaryColor,
            width: double.infinity,
            child: Text(
              'Puntos: $points',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: theme.textTheme.bodyLarge?.color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: yPosition,
                  left: xPosition,
                  child: GestureDetector(
                    onTap: () {
                      if (!imageTouched && !imageLocked) {
                        setState(() {
                          points++;
                          if (points == 20) {
                            showSnackBar('¡Genial! Has conseguido 20 puntos.');
                          }
                          imageTouched = true;
                          imageLocked = true;
                          _savePoints(); // Guardar puntos cada vez que tocan la imagen
                        });
                      }
                    },
                    child: randomImage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void getRandomImage() {
    Random random = Random();
    int randomNumber = random.nextInt(imagesPaths.length);
    randomImage =
        Image.asset(imagesPaths[randomNumber], width: 120, height: 120);

    xPosition = random.nextDouble() * maxWidth;
    yPosition = random.nextDouble() * maxHeight;

    imageTouched = false;
    imageLocked = false;
  }

  @override
  void dispose() {
    _timer.cancel();
    ScaffoldMessenger.of(context).clearSnackBars();
    super.dispose();
  }
}
