import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  tooltip: 'Volver',
                ),
                const SizedBox(width: 44),
                const Text(
                  "GokuInfinito",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 44),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.send_rounded),
                  onPressed: () {},
                  tooltip: 'Enviar',
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  tooltip: 'Más opciones',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
