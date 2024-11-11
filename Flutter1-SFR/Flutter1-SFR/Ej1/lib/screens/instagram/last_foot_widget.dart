import 'package:flutter/material.dart';

class LastFootWidget extends StatelessWidget {
  const LastFootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
      children: [ Expanded(
            child: IconButton(
              onPressed: () {}, 
              color: Colors.black,
              icon: const Icon(Icons.home),
            ),
          ),Expanded(
            child: IconButton(
              onPressed: () {}, 
              color: Colors.black,
              icon: const Icon(Icons.search),
            ),
          )   ,Expanded(
            child: IconButton(
              onPressed: () {},
              color: Colors.black,
              icon: const Icon(Icons.add_box_outlined),
            ),
          )   ,Expanded(
            child: IconButton(
              onPressed: () {},
              color: Colors.black,
              icon: const Icon(Icons.heart_broken),
            ),
          )   ,Expanded(
            child: IconButton(
              onPressed: () {}, 
              color: Colors.black,
              icon: const Icon(Icons.supervised_user_circle_rounded),
            ),
          )      
        ]));}
      
    
  }

