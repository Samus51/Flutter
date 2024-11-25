import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final bool isColorMode;

  const GridViewWidget({super.key, required this.isColorMode});

  @override
  Widget build(BuildContext context) {
    final List<String> list1 = [
      'assets/images/ibai.jpg',
      'assets/images/illojuan.jpg',
      'assets/images/orslok.jpg',
      'assets/images/polispol.jpg',
      'assets/images/vegetta777.jpg',
      'assets/images/gaben.jpg',
      'assets/images/gus.jpg',
      'assets/images/chama.jpg',
      'assets/images/chillguy.jpg',
      'assets/images/jarvis.jpg',
      'assets/images/jesse.jpg',
      'assets/images/jorge.jpg',
    ];

    final List<String> list2 = [
      'assets/images/kendrick.jpg',
      'assets/images/kiko.jpg',
      'assets/images/lolito.jpg',
      'assets/images/melapela.jpg',
      'assets/images/moros.jpg',
      'assets/images/nano.jpg',
      'assets/images/pov.jpg',
      'assets/images/sandia.jpg',
      'assets/images/soserious.jpg',
      'assets/images/walter.jpg',
      'assets/images/willy.jpg',
      'assets/images/xokas.jpg',
    ];

    final List<String> images = isColorMode ? list1 : list2;

    return SizedBox(
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[300],
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
