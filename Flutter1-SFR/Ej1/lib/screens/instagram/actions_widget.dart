import 'package:flutter/material.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildImageWithText("Cancún"),
            _buildImageWithText("Arroyo Coches"),
            _buildImageWithText("Tiro Pichón"),
            _buildImageWithText("Bar Manolo"),
            _buildImageWithText("Lukas Grijander"),
          ],
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildImageWithText(String text) {
    return Column(
      children: [
        ClipOval(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
            ),
            child: Image.asset(
              "assets/images/ibai.jpg",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error,
                    size: 50);
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
    );
  }
}
