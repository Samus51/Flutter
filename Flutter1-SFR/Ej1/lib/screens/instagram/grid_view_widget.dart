import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Center(
                child: Text('Item ${index + 1}',
                    style: const TextStyle(fontSize: 16))), 
          );
        },
      ),
    );
  }
}
