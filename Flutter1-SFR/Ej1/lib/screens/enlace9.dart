import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:holamundo/drawer/menu_lateral.dart';

class RandomImages extends StatefulWidget {
  const RandomImages({super.key});

  @override
  _RandomImages createState() => _RandomImages();
}

class _RandomImages extends State<RandomImages> {
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
    getRandomImage();
    startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    maxWidth = MediaQuery.of(context).size.width - 120;
    maxHeight = MediaQuery.of(context).size.height - 250;
  }

  void startTimer() {
    _timer = Timer.periodic(timeLimit, (timer) {
      setState(() {
        if (!imageTouched) {
          int prevPoints = points; // Guarda los puntos antes de restar
          points -= 2;

          // Mostrar SnackBar solo si los puntos pasan a negativos
          if (prevPoints >= 0 && points < 0) {
            showSnackBar('¡Cuidado! Tienes puntos negativos :(');
          }
        }
        imageLocked = false;
        getRandomImage();
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

  // Método para mostrar el SnackBar
  void showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context)
          .clearSnackBars(); // Limpia SnackBars anteriores
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
    ScaffoldMessenger.of(context).clearSnackBars(); // Limpia cualquier SnackBar
    super.dispose();
  }
}
