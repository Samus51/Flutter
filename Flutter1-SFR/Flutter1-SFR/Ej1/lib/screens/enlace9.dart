import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'screens.dart';

void main() {
  runApp(const RandomImages());
}

class RandomImages extends StatefulWidget {
  const RandomImages({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
  bool pulsado = false;
  double xPosition = 0;
  double yPosition = 0;

  @override
  void initState() {
    super.initState();
    getRandomImage();
    startTimer();
  }

  void startTimer() {
    _timer = Timer(timeLimit, () {
      if (!pulsado) {
        setState(() {
          points -= 2;
          getRandomImage();
        });
      }
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtención del tamaño de la pantalla en el build()
    double maxWidth = MediaQuery.of(context).size.width - 120; // Restar el tamaño de la imagen
    double maxHeight = MediaQuery.of(context).size.height - 150; // Restar más espacio para los puntos y la barra de la app

    // Calcular posiciones aleatorias dentro del tamaño de la pantalla, asegurando que no se sobrepongan con el texto de los puntos
    xPosition = Random().nextDouble() * maxWidth;
    yPosition = Random().nextDouble() * maxHeight; 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
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
            // Título de los puntos, que permanece fijo
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blueAccent,
              width: double.infinity,
              child: Text(
                'Puntos: $points',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Mostrar la imagen en una posición aleatoria
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: yPosition,
                    left: xPosition,
                    child: GestureDetector(
                      onTap: pulsado
                          ? null
                          : () {
                              setState(() {
                                points++;
                                pulsado = true;
                                getRandomImage();
                              });
                            },
                      child: randomImage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getRandomImage() {
    Random random = Random();
    int randomNumber = random.nextInt(imagesPaths.length);
    randomImage = Image.asset(imagesPaths[randomNumber], width: 120, height: 120);

    pulsado = false;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
