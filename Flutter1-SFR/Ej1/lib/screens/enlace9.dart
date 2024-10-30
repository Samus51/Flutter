import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const RandomImages());
}

class RandomImages extends StatefulWidget {
  const RandomImages({super.key});

  @override
  _RandomImages createState() => _RandomImages();
}

class _RandomImages extends State<RandomImages> {
  int points = 0;
  late String randomName;
  late Image randomImage;
  final List<String> imagesNames = [
    'ibai', 
    'illojuan', 
    'orslok', 
    'polispol', 
    'vegetta777', 
    'papa'
  ];
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
  bool hasTapped = false; 

  @override
  void initState() {
    super.initState();
    getRandomImage(); // Obtiene una imagen aleatoria al iniciar
    startTimer(); // Inicia el temporizador
  }

  void startTimer() {
    _timer = Timer(timeLimit, () {
      if (!hasTapped) {
        points -= 2; // Resta 2 puntos si no se hace clic
        setState(() {}); // Actualiza el estado
      }
      getRandomImage(); // Obtiene una nueva imagen
      startTimer(); // Reinicia el temporizador
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Puntos: $points',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  onGiftTap(randomName);
                },
                child: Column(
                  children: [
                    randomImage,
                    Text(
                      randomName,
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getRandomImage() {
    Random random = Random();
    int randomNumber = random.nextInt(imagesNames.length); 
    randomName = imagesNames[randomNumber];
    randomImage = Image.asset(imagesPaths[randomNumber], width: 120, height: 120);
    hasTapped = false; 
  }

  void onGiftTap(String name) {
    hasTapped = true; 
    if (name == randomName) {
      points++; // Suma 1 punto si el nombre coincide
    } else {
      points--; // Resta 1 punto si no coincide
    }
    setState(() {}); // Actualiza el estado
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancela el temporizador al destruir el widget
    super.dispose();
  }
}
