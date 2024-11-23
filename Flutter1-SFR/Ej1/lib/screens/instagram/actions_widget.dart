import 'package:flutter/material.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildImageWithText("Tiro Pichón", "tiropichon.jpg"),
                _buildImageWithText("La Playita", "playita.jpg"),
                _buildImageWithText("Lukas Grijander", "lukasgrijander.jpg"),
                _buildImageWithText("Cancún", "cancun.jpg"),
                _buildImageWithText("Bar Manolo", "barmanolo.jpg"),
                _buildImageWithText("Arroyo Coches", "arroyocoches.jpg"),
                _buildImageWithText("Guarromán", "guarroman.jpg"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildImageWithText(String text, String imageFile) {
    String imagePath = 'assets/images/$imageFile';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipOval(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: const CircleBorder(),
              ),
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50);
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
