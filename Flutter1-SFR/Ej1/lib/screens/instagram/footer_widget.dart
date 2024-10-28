import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 20), 
          child: Container(
            width: 450,
            height: 1,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey
                      .withOpacity(0.3), 
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.view_compact),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_box_outlined),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20), // Espacio arriba
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey
                          .withOpacity(0.7), // Ajustar la opacidad del color
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
